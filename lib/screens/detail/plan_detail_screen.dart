import 'package:daily_planner_app/components/state_button.dart';
import 'package:daily_planner_app/constants.dart';
import 'package:daily_planner_app/controllers/new_plan_controller.dart';
import 'package:daily_planner_app/controllers/plan_controller.dart';
import 'package:daily_planner_app/models/plan.dart';
import 'package:daily_planner_app/screens/add/add_plan_screen.dart';
import 'package:daily_planner_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'components/date_bar.dart';
import 'components/time_bar.dart';
import 'components/title_bar.dart';

class PlanDetailScreen extends StatelessWidget {
  PlanDetailScreen({Key? key, required this.plan}) : super(key: key);

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(defaultPadding)),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            VerticalSpacing(),
            Row(
              children: [
                // Title
                TitleBar(plan: plan),
                Spacer(),

                // State Icon
                GetBuilder<PlanController>(
                    init: PlanController(),
                    builder: (controller) {
                      return StateButton(
                        plan: plan,
                        size: getProportionateScreenHeight(appbarIconSize),
                        press: () {
                          controller.planStateChange(plan);
                        },
                      );
                    }),
              ],
            ),
            Divider(),
            VerticalSpacing(),

            // DateBar
            DateBar(plan: plan),
            Divider(),
            VerticalSpacing(),

            // TimeBar
            TimeBar(startTime: plan.startTime, endTime: plan.endTime),
            Divider(),
            VerticalSpacing(),

            Spacer(),

            // plan detail content
            Expanded(
                flex: 10,
                child: Container(
                    width: double.infinity,
                    child: Text(plan.content,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: kBlackColor,
                            fontSize:
                                getProportionateScreenHeight(subtitle1))))),
            VerticalSpacing(),
          ]),
        ),
      ),
    );
  }

  AppBar buildAppBar(context) {
    PlanController _planController = Get.put(PlanController());

    return AppBar(
      leading: BackButton(
        color: kBlackColor,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      actions: [
        // delete plan button
        InkWell(
          borderRadius: BorderRadius.circular(SizeConfig.padding.top / 2),
          onTap: () async {
            final result = await _planController.deletePlan(plan);

            if (result) {
              Get.back();
            } else {
              if (!Get.isSnackbarOpen!) {
                Get.snackbar(
                  '실패',
                  '플랜 삭제에 실패했습니다.',
                  isDismissible: true,
                );
              }
            }
          },
          child: SizedBox(
            child: Image.asset(
              'assets/delete_icon.png',
              width: getProportionateScreenHeight(appbarIconSize),
            ),
          ),
        ),
        HorizontalSpacing(),

        // edit plan button
        InkWell(
          borderRadius: BorderRadius.circular(SizeConfig.padding.top / 2),
          onTap: () async {
            final result = await Get.to(GetBuilder<NewPlanController>(
                init: NewPlanController.fromPlan(plan: plan),
                global: false,
                builder: (controller) {
                  return AddPlanScreen(newPlanController: controller);
                }));

            if (result == null) return;
            if (result) Get.back();
          },
          child: Image.asset('assets/edit_icon.png',
              width: getProportionateScreenHeight(appbarIconSize)),
        ),
        SizedBox(width: defaultPadding)
      ],
    );
  }
}
