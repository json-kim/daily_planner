import 'package:daily_planner_app/models/plan.dart';
import 'package:daily_planner_app/size_config.dart';
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
        Container(
            width: getProportionateScreenHeight(24),
            height: getProportionateScreenHeight(24),
            color: Color(plan.colorValue)),

        HorizontalSpacing(),

        // Title
        AnimatedSwitcher(
          duration: defaultDuration,
          child: FittedBox(
            key: ValueKey(plan.state),
            child: Text(
              plan.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  decoration: plan.state ? TextDecoration.lineThrough : null,
                  color: kBlackColor,
                  fontSize: getProportionateScreenHeight(headline5)),
            ),
          ),
        ),
      ],
    );
  }
}
