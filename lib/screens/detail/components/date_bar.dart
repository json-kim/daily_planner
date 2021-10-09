import 'package:daily_planner_app/models/plan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';

class DateBar extends StatelessWidget {
  const DateBar({
    Key? key,
    required this.plan,
  }) : super(key: key);

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),

        // Date
        Container(
          padding: EdgeInsets.symmetric(
              vertical: defaultPadding * 0.5, horizontal: defaultPadding),
          child: Text(
            DateFormat('y-M-d E').format(plan.startTime),
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: kBlackColor),
          ),
        ),

        // Plan Color Box
        Container(width: 16, height: 16, color: Color(plan.colorValue)),
      ],
    );
  }
}
