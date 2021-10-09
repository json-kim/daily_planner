import 'package:daily_planner_app/models/plan.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    Key? key,
    required this.plan,
  }) : super(key: key);

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: plan.title,
      child: Row(
        children: [
          Image.asset(
            'assets/calendar.png',
            height: 32,
          ),
          SizedBox(
            width: defaultPadding * 0.5,
          ),
          FittedBox(
            child: Text(
              plan.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: kBlackColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}