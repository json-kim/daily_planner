import 'package:daily_planner_app/components/state_button.dart';
import 'package:daily_planner_app/constants.dart';
import 'package:daily_planner_app/controllers/plan_controller.dart';
import 'package:daily_planner_app/models/plan.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'components/date_bar.dart';
import 'components/time_bar.dart';
import 'components/title_bar.dart';

class PlanDetailScreen extends StatelessWidget {
  const PlanDetailScreen({Key? key, required this.plan}) : super(key: key);

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: defaultPadding,
            ),
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
                        size: 32,
                        press: () {
                          controller.planStateChange(plan);
                        },
                      );
                    }),
              ],
            ),
            SizedBox(
              height: defaultPadding,
            ),

            // DateBar
            DateBar(plan: plan),
            SizedBox(
              height: defaultPadding,
            ),

            // TimeBar
            TimeBar(startTime: plan.startTime, endTime: plan.endTime),
            Spacer(),

            // D-time Bar

            // plan detail content
            Expanded(
                flex: 10,
                child: Container(
                    width: double.infinity,
                    child: Text(plan.content,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: kBlackColor,
                            )))),
            SizedBox(height: defaultPadding),
          ]),
        ),
      ),
    );
  }

  AppBar buildAppBar(context) {
    return AppBar(
      leading: BackButton(
        color: kBlackColor,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      // title: Hero(
      //   tag: plan.title,
      //   child: Text(plan.title,
      //       style: Theme.of(context)
      //           .textTheme
      //           .headline6!
      //           .copyWith(color: kBlackColor)),
      // ),
      centerTitle: true,
      actions: [
        Icon(
          Icons.edit_outlined,
          color: kBlackColor,
        ),
        SizedBox(width: defaultPadding)
      ],
    );
  }
}
