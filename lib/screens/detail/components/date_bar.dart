import 'package:daily_planner_app/models/plan.dart';
import 'package:daily_planner_app/size_config.dart';
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
            vertical: getProportionateScreenHeight(defaultPadding * 0.5),
          ),
          child: Text(
            DateFormat('y-M-d E').format(plan.startTime),
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: kBlackColor,
                fontSize: getProportionateScreenHeight(headline6)),
          ),
        ),
      ],
    );
  }
}
