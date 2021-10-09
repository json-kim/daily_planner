import 'package:daily_planner_app/controllers/date_controller.dart';
import 'package:daily_planner_app/controllers/plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/instance_manager.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../constants.dart';

class DateBar extends StatefulWidget {
  const DateBar({
    Key? key,
  }) : super(key: key);

  @override
  _DateBarState createState() => _DateBarState();
}

class _DateBarState extends State<DateBar> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController(keepScrollOffset: true);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Column(
      children: [
        // 요일 목록
        Container(
          child: Row(
            children: List.generate(
                7,
                (index) => Expanded(
                      child: Container(
                          alignment: Alignment.center,
                          child: Text(dateString[index])),
                    )),
          ),
        ),
        SizedBox(
          height: defaultPadding * 0.2,
        ),

        // Date List
        GetBuilder<DateController>(
            init: DateController(),
            builder: (controller) {
              return Container(
                width: double.infinity,
                height: _size.height * 0.05,
                child: ListView.builder(
                  physics: PageScrollPhysics(),
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.dates.length,
                  itemBuilder: (context, index) {
                    return DateCard(
                      date: controller.dates[index],
                      size: (_size.width - defaultPadding * 2) / 7,
                    );
                  },
                ),
              );
            }),
      ],
    );
  }
}

class DateCard extends StatelessWidget {
  const DateCard({
    Key? key,
    required this.date,
    this.size = 50,
  }) : super(key: key);

  final DateTime date;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 0.2),
        child: GetBuilder<DateController>(
            init: DateController(),
            builder: (controller) {
              Color color = kGrayColor;
              DateTime sDate = controller.selectedDate;
              if (date.year == sDate.year &&
                  date.month == sDate.month &&
                  sDate.day == date.day) {
                color = cardColor;
              }

              return InkWell(
                onTap: () => controller.setSelectedDate(date),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: color,
                  ),
                  alignment: Alignment.center,
                  child: FittedBox(
                    child: Text('${date.month}/${date.day}',
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              color: Colors.black,
                            )),
                  ),
                ),
              );
            }));
  }
}
