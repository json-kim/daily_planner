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
    return Row(
      children: [
        // Plan Color Box
        Container(width: 24, height: 24, color: Color(plan.colorValue)),

        SizedBox(
          width: defaultPadding,
        ),

        // Title
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
    );
  }
}
