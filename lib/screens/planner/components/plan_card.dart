import 'package:daily_planner_app/components/state_button.dart';
import 'package:daily_planner_app/controllers/plan_controller.dart';
import 'package:daily_planner_app/screens/detail/plan_detail_screen.dart';
import 'package:daily_planner_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import 'package:daily_planner_app/models/plan.dart';
import '../../../constants.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({Key? key, required this.plan}) : super(key: key);

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    PlanController _controller = Get.put(PlanController());
    SizeConfig.init(context);

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding * 0.5,
      ),
      child: GestureDetector(
        onTap: () {
          Get.to(PlanDetailScreen(plan: plan));
        },
        onLongPress: () async {
          // await showMenu(
          //     context: context,
          //     position: RelativeRect.fromSize(
          //         Rect.fromPoints(Offset.zero, Offset.zero), Size(100, 100)),
          //     items: [
          //       PopupMenuItem(child: Text('1번')),
          //       PopupMenuItem(child: Text('2번')),
          //       PopupMenuItem(child: Text('3번')),
          //     ]);
        },
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(defaultPadding * 2),
                  vertical: getProportionateScreenHeight(defaultPadding)),
              width: double.infinity,
              height: getProportionateScreenHeight(110),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenWidth(25)),
                  color: Color(plan.colorValue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(5, 5)),
                  ]),
            ),
            Positioned(
              left: getProportionateScreenWidth(5),
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        getProportionateScreenWidth(defaultPadding * 1.5),
                    vertical:
                        getProportionateScreenHeight(defaultPadding * 0.75)),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(getProportionateScreenWidth(25)),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        // Title
                        Text(
                          plan.title,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  decoration: plan.state
                                      ? TextDecoration.lineThrough
                                      : null,
                                  fontSize:
                                      getProportionateScreenHeight(subtitle1),
                                  color: Colors.black),
                        ),
                        Spacer(),

                        // State Icon
                        StateButton(
                          plan: plan,
                          press: () => _controller.planStateChange(plan),
                          size: getProportionateScreenHeight(24),
                        )
                      ],
                    ),
                    Divider(
                      thickness: getProportionateScreenHeight(1.5),
                      height: getProportionateScreenHeight(defaultPadding * 2),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Time
                        Icon(
                          Icons.timer,
                          size: getProportionateScreenHeight(cardIconSize),
                        ),
                        SizedBox(
                          width: defaultPadding * 0.1,
                        ),
                        FittedBox(
                          child: Text(
                            '''${DateFormat('HH:mma').format(plan.startTime)} ~ ${DateFormat('HH:mma').format(plan.endTime)}, ${plan.endTime.difference(plan.startTime).inHours} hours''',
                            style: TextStyle(
                                fontSize:
                                    getProportionateScreenHeight(subtitle2)),
                          ),
                        ),
                        Spacer(),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
