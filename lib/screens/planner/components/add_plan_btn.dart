import 'package:daily_planner_app/constants.dart';
import 'package:daily_planner_app/controllers/new_plan_controller.dart';
import 'package:daily_planner_app/controllers/plan_controller.dart';
import 'package:daily_planner_app/screens/add/add_plan_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class AddPlanBtn extends StatelessWidget {
  const AddPlanBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PlanController _planController = Get.put(PlanController());
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding),
      child: InkWell(
        onTap: () => Get.to(GetBuilder<NewPlanController>(
            init: NewPlanController(),
            global: false,
            builder: (controller) {
              return AddPlanScreen(newPlanController: controller);
            })),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: defaultGradient,
              borderRadius:
                  BorderRadius.all(Radius.circular(defaultPadding * 2.5))),
          child: Text(
            '일정 추가하기',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
