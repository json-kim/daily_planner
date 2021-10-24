import 'package:daily_planner_app/controllers/date_controller.dart';
import 'package:daily_planner_app/screens/planner/components/plan_list.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../../constants.dart';
import 'add_plan_btn.dart';
import 'date_bar.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Stack(
      fit: StackFit.expand,
      children: [
        // Backgroud
        Positioned.fill(
            child: Container(
          color: bgColor,
        )),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: defaultPadding,
              ),
              // DateBar
              DateBar(),
              SizedBox(height: defaultPadding),

              // PlanList
              Expanded(child: PlanList()),
            ],
          ),
        )),

        // Add Button
        Positioned(
            bottom: 0,
            right: 0,
            height: _size.height * 0.1,
            child: AddPlanBtn())
      ],
    );
  }
}
