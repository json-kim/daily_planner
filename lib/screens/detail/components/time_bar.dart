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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // start time
        //hour
        Container(
          padding: EdgeInsets.symmetric(
              vertical: defaultPadding * 2, horizontal: defaultPadding * 1.5),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            DateFormat('HH').format(startTime),
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: kBlackColor),
          ),
        ),
        SizedBox(width: defaultPadding * 0.2),

        // minute
        Container(
          padding: EdgeInsets.symmetric(
              vertical: defaultPadding * 2, horizontal: defaultPadding * 1.5),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            DateFormat('mm').format(endTime),
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: kBlackColor),
          ),
        ),
        Spacer(),
        Text(
          ':',
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: kBlackColor),
        ),
        Spacer(),

        // end time
        // hour
        Container(
          padding: EdgeInsets.symmetric(
              vertical: defaultPadding * 2, horizontal: defaultPadding * 1.5),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            DateFormat('HH').format(endTime),
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: kBlackColor),
          ),
        ),
        SizedBox(width: defaultPadding * 0.2),

        // minute
        Container(
          padding: EdgeInsets.symmetric(
              vertical: defaultPadding * 2, horizontal: defaultPadding * 1.5),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            DateFormat('mm').format(startTime),
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: kBlackColor),
          ),
        ),
      ],
    );
  }
}
