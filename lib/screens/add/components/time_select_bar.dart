import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';

class TimeSelectBar extends StatelessWidget {
  const TimeSelectBar({
    Key? key,
    required this.startTime,
    required this.endTime,
    required this.setStartTime,
    required this.setEndTime,
    required this.isTimeError,
  }) : super(key: key);

  final TimeOfDay startTime, endTime;
  final ValueChanged<TimeOfDay> setStartTime, setEndTime;
  final bool isTimeError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            // Time Icon
            SizedBox(height: 36, child: Image.asset('assets/time_icon.png')),
            SizedBox(
              width: defaultPadding,
            ),

            // Start Time
            Expanded(
                child: InkWell(
              onTap: () async {
                final chosenStartTime = await showTimePicker(
                    context: context, initialTime: startTime);

                if (chosenStartTime != null) {
                  setStartTime(chosenStartTime);
                }
              },
              borderRadius: BorderRadius.circular(15),
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical: defaultPadding * 0.75),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15)),
                alignment: Alignment.center,
                child: Text(
                  '${NumberFormat('00').format(startTime.hour)}시 ${NumberFormat('00').format(startTime.minute)}분',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: kBlackColor),
                ),
              ),
            )),
            SizedBox(
              width: defaultPadding,
              child: Center(
                  child: Text(
                '~',
                style: TextStyle(fontSize: defaultPadding),
              )),
            ),

            // End Time
            Expanded(
              child: InkWell(
                onTap: () async {
                  final chosenEndTime = await showTimePicker(
                    context: context,
                    initialTime: endTime,
                  );

                  if (chosenEndTime != null) {
                    setEndTime(chosenEndTime);
                  }
                },
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                      vertical: defaultPadding * 0.75),
                  decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15)),
                  alignment: Alignment.center,
                  child: Text(
                    '${NumberFormat('00').format(endTime.hour)}시 ${NumberFormat('00').format(endTime.minute)}분',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: kBlackColor),
                  ),
                ),
              ),
            )
          ],
        ),
        if (isTimeError)
          Padding(
            padding: EdgeInsets.only(top: defaultPadding / 2),
            child: Text('시간 설정을 바르게 해주세요!',
                style: TextStyle(
                  color: kRedColor,
                )),
          ),
      ],
    );
  }
}
