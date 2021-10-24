import 'package:daily_planner_app/models/plan.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class StateButton extends StatelessWidget {
  const StateButton({
    Key? key,
    required this.plan,
    required this.press,
    this.size = 16,
  }) : super(key: key);

  final Plan plan;
  final VoidCallback press;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Icon(
        Icons.done,
        size: size,
        color: plan.state ? kGreenColor : kGrayColor,
      ),
    );
  }
}
