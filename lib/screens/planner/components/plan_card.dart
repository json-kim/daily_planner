import 'package:daily_planner_app/components/state_button.dart';
import 'package:daily_planner_app/controllers/plan_controller.dart';
import 'package:daily_planner_app/screens/detail/plan_detail_screen.dart';
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
    final _size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding * 0.5,
      ),
      child: GestureDetector(
        onTap: () {
          Get.to(PlanDetailScreen(plan: plan));
        },
        onLongPress: () async {
          await showMenu(
              context: context,
              position: RelativeRect.fromSize(
                  Rect.fromPoints(Offset.zero, Offset.zero), Size(100, 100)),
              items: [
                PopupMenuItem(child: Text('1번')),
                PopupMenuItem(child: Text('2번')),
                PopupMenuItem(child: Text('3번')),
              ]);
        },
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 2, vertical: defaultPadding),
              width: double.infinity,
              height: _size.height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Color(plan.colorValue),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(5, 5)),
                  ]),
            ),
            Positioned(
              left: 5,
              right: 0,
              top: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: defaultPadding * 2, vertical: defaultPadding),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        // Title
                        Hero(
                          tag: plan.title,
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/calendar.png',
                                height: 24,
                              ),
                              SizedBox(
                                width: defaultPadding * 0.3,
                              ),
                              Text(
                                plan.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),

                        // State Icon
                        StateButton(
                          plan: plan,
                          press: () => _controller.planStateChange(plan),
                          size: 24,
                        )
                      ],
                    ),
                    Divider(
                      thickness: 1.5,
                      height: defaultPadding * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Time
                        Icon(Icons.timer),
                        SizedBox(
                          width: defaultPadding * 0.1,
                        ),
                        Text(
                            '${DateFormat('HH:mma').format(plan.startTime)}-${DateFormat('HH:mma').format(plan.endTime)}, ${plan.endTime.difference(plan.startTime).inHours} hours'),
                        Spacer(),

                        // Profile
                        CircleAvatar(
                          backgroundImage: AssetImage('assets/profile.jpg'),
                        )
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
