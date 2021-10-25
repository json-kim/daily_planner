import 'package:daily_planner_app/controllers/date_controller.dart';
import 'package:daily_planner_app/screens/planner/components/plan_list.dart';
import 'package:daily_planner_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

import '../../../constants.dart';
import 'add_plan_btn.dart';
import 'date_bar.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

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
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(defaultPadding)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpacing(),
              // DateBar
              DateBar(),
              VerticalSpacing(),

              // PlanList
              Expanded(child: PlanList()),
            ],
          ),
        )),

        // Add Button
        Positioned(
            bottom: 0,
            right: 0,
            height: getProportionateScreenHeight(bottomButtonHeight),
            child: AddPlanBtn(
                size: getProportionateScreenHeight(bottomButtonHeight)))
      ],
    );
  }
}
