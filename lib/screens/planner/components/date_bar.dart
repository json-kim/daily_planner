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
    DateController _dateController = Get.put(DateController());
    final _size = MediaQuery.of(context).size;

    return GetBuilder<DateController>(
        init: DateController(),
        builder: (controller) {
          return Column(
            children: [
              // Year
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Plan ${controller.selectedDate.year}',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.black, fontSize: 40),
                  ),

                  // back to the selectedDate Button
                  IconButton(
                    onPressed: () {
                      final offset = (_size.width - 2 * defaultPadding) *
                          (controller.getSelectedDateIndex() ~/ 7);
                      _scrollController.animateTo(offset + 5,
                          curve: Curves.easeIn, duration: defaultDuration);
                    },
                    icon: Icon(Icons.refresh),
                  ),
                ],
              ),
              SizedBox(
                height: defaultPadding,
              ),

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
              Container(
                width: double.infinity,
                height: _size.height * 0.05,
                child: SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: true,
                  controller: _refreshController,
                  footer: ClassicFooter(
                      loadStyle: LoadStyle.ShowWhenLoading,
                      completeDuration: Duration.zero,
                      loadingText: '',
                      idleText: null,
                      idleIcon: null),
                  header: ClassicHeader(
                    refreshStyle: RefreshStyle.Behind,
                    completeDuration: Duration.zero,
                    completeIcon: null,
                    completeText: '',
                    releaseText: 'relase',
                    refreshingText: '',
                    idleText: '',
                    idleIcon: null,
                  ),
                  onLoading: () async {
                    await Future.delayed(Duration(milliseconds: 500));
                    controller.addWeeksToDates();

                    setState(() {
                      _refreshController.loadComplete();
                    });
                  },
                  onRefresh: () async {
                    await Future.delayed(Duration(milliseconds: 500));
                    controller.addWeeksToDates(isAfter: false);

                    setState(() {
                      _refreshController.refreshCompleted();
                    });
                  },
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
                ),
              ),
            ],
          );
        });
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
                  padding:
                      EdgeInsets.symmetric(horizontal: defaultPadding * 0.15),
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
