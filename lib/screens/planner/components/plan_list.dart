import 'package:daily_planner_app/constants.dart';
import 'package:daily_planner_app/controllers/plan_controller.dart';
import 'package:daily_planner_app/screens/planner/components/plan_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';

class PlanList extends StatelessWidget {
  const PlanList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PlanController>(
        init: PlanController(),
        builder: (controller) {
          final selectedPlans = controller.selectedPlans;

          return AnimatedSwitcher(
            duration: defaultDuration,
            switchInCurve: Curves.easeIn,
            child: selectedPlans.length != 0
                ? Container(
                    key: ValueKey(controller.selectedPlans.toString()),
                    height: double.infinity,
                    //color: kGrayColor,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...List.generate(controller.selectedPlans.length,
                              (idx) {
                            return PlanCard(
                                key: ValueKey(
                                    controller.selectedPlans[idx].planId),
                                plan: controller.selectedPlans[idx]);
                          })
                        ],
                      ),
                    ),
                  )
                : Container(
                    key: ValueKey(controller.selectedPlans.toString()),
                    alignment: Alignment.center,
                    child: Text(
                      '이 날은 아직 계획이 없네요!\n그동안 미뤄왔던 일에 도전해보세요!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
          );
        });
  }
}
