import 'package:daily_planner_app/controllers/plan_controller.dart';
import 'package:daily_planner_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';

class TimeBar extends StatelessWidget {
  TimeBar({
    Key? key,
    required this.startTime,
    required this.endTime,
    required this.state,
  }) : super(key: key);

  final DateTime startTime, endTime;
  final bool state;

  String getDTimeString(DateTime start, DateTime end) {
    final now = DateTime.now();

    if (now.isBefore(start)) {
      final remain = -now.difference(start);
      final ms = remain.inMinutes;
      String time;
      if (ms >= 1440)
        time = '${ms ~/ 1440} 일';
      else if (ms >= 60)
        time = '${ms ~/ 60} 시간';
      else
        time = '$ms 분';
      return '시작까지 $time 남았습니다.';
    } else if (now.isAfter(start) && now.isBefore(end)) {
      return '진행 중 입니다.';
    } else {
      return '시간이 종료 되었습니다.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // start time
        Container(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(defaultPadding),
          ),
          child: Text(DateFormat('HH:mm').format(startTime),
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: kBlackColor,
                  fontSize: getProportionateScreenHeight(headline6))),
        ),

        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(defaultPadding * 0.2)),
          child: Text(
            '~',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: kBlackColor,
                fontSize: getProportionateScreenHeight(headline6)),
          ),
        ),

        // end time
        Container(
          padding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(defaultPadding),
          ),
          child: Text(
            DateFormat('HH:mm').format(endTime),
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: kBlackColor,
                fontSize: getProportionateScreenHeight(headline6)),
          ),
        ),

        // Total Time and D-time
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(defaultPadding),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'total ${endTime.difference(startTime).inHours < 1 ? endTime.difference(startTime).inMinutes.toString() + ' mins' : endTime.difference(startTime).inHours.toString() + ' hours'}',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: kBlackColor,
                      fontSize: getProportionateScreenHeight(headline6)),
                ),
                AnimatedSwitcher(
                  duration: defaultDuration,
                  child: Container(
                    width: double.infinity,
                    key: ValueKey(state),
                    child: Text(
                        state
                            ? '완료 되었습니다.'
                            : getDTimeString(startTime, endTime),
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          fontSize: getProportionateScreenHeight(14),
                          color: kRedColor,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
