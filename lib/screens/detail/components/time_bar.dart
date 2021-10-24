import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';

class TimeBar extends StatelessWidget {
  const TimeBar({
    Key? key,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  final DateTime startTime, endTime;

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
      return '종료되었습니다.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // start time
        Container(
          padding: EdgeInsets.symmetric(
            vertical: defaultPadding,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            DateFormat('HH:mm').format(startTime),
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: kBlackColor),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 0.2),
          child: Text(
            '~',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: kBlackColor),
          ),
        ),

        // end time
        Container(
          padding: EdgeInsets.symmetric(
            vertical: defaultPadding,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            DateFormat('HH:mm').format(endTime),
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: kBlackColor),
          ),
        ),

        Spacer(),

        // Total Time and D-time
        Container(
          padding: EdgeInsets.symmetric(
            vertical: defaultPadding,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Text(
                'total ${endTime.difference(startTime).inHours < 1 ? endTime.difference(startTime).inMinutes.toString() + ' mins' : endTime.difference(startTime).inHours.toString() + ' hours'}',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: kBlackColor),
              ),
              Text(getDTimeString(startTime, endTime),
                  style: TextStyle(
                    fontSize: 14,
                    color: kRedColor,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}
