import 'package:daily_planner_app/constants.dart';
import 'package:daily_planner_app/controllers/new_plan_controller.dart';
import 'package:daily_planner_app/controllers/plan_controller.dart';
import 'package:daily_planner_app/screens/add/add_plan_screen.dart';
import 'package:daily_planner_app/size_config.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class AddPlanBtn extends StatelessWidget {
  const AddPlanBtn({Key? key, required this.size}) : super(key: key);

  final double size;

  @override
  Widget build(BuildContext context) {
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
        child: GetBuilder<PlanController>(
            init: PlanController(),
            builder: (controller) {
              return AnimatedContainer(
                duration: defaultDuration,
                // TODO: Size 깔끔하게 고치기
                width: controller.selectedPlans.length == 0
                    ? (SizeConfig.screenWidth - 2 * defaultPadding)
                    : size - 2 * defaultPadding,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: defaultGradient,
                    borderRadius:
                        BorderRadius.all(Radius.circular(size * 0.5))),
                child: controller.selectedPlans.length == 0
                    ? Text(
                        '일정 추가하기',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: getProportionateScreenHeight(headline6),
                            color: Colors.white),
                      )
                    : Icon(
                        Icons.add,
                        color: Colors.white,
                        size: getProportionateScreenHeight(28),
                      ),
              );
            }),
      ),
    );
  }
}
