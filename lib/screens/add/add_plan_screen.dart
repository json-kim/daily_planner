import 'package:daily_planner_app/constants.dart';
import 'package:daily_planner_app/controllers/new_plan_controller.dart';
import 'package:daily_planner_app/controllers/plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddPlanScreen extends StatefulWidget {
  final NewPlanController newPlanController;
  const AddPlanScreen({Key? key, required this.newPlanController})
      : super(key: key);

  @override
  _AddPlanScreenState createState() => _AddPlanScreenState();
}

class _AddPlanScreenState extends State<AddPlanScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PlanController _planController = Get.put(PlanController());

    return Scaffold(
      appBar: _buildAppBar(),

      //TODO: Save Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            bottom: defaultPadding,
            left: defaultPadding,
            right: defaultPadding),
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: defaultGradient,
              borderRadius: BorderRadius.circular(25)),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: null,
              primary: Colors.transparent,
              onSurface: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            onPressed: () {
              if (widget.newPlanController.planSave()) {
                Get.back();
              }
            },
            child: Text(
              'save'.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Form(
          key: widget.newPlanController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //TODO:Title Input Form
              SizedBox(
                height: defaultPadding * 0.5,
              ),
              Row(
                children: [
                  Container(
                    width: 36,
                    child: FittedBox(
                      child: Text(
                        'Title'.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2!
                            .copyWith(color: kBlackColor),
                      ),
                    ),
                  ),
                  SizedBox(width: defaultPadding),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding * 0.25),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      child: TextFormField(
                        validator: (val) {
                          if (val == null || val.length == 0) {
                            return '제목을 입력해주세요!';
                          } else if (val.length > 30) {
                            return '제목은 30자 이하로 작성해주세요! 현재 ${val.length}자';
                          }
                        },
                        onSaved: (val) =>
                            widget.newPlanController.setTitle(val!),
                        cursorColor: kBlackColor,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '일정의 제목을 적어주세요!',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: defaultPadding,
              ),

              //TODO: Date Select Bar
              Row(
                children: [
                  // Date Icon
                  SizedBox(
                    height: 36,
                    child: Image.asset(
                      'assets/calendar_icon.png',
                    ),
                  ),
                  SizedBox(
                    width: defaultPadding,
                  ),

                  // Date(Month, Day, Weekday)
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        final chosenDate = await showDatePicker(
                            context: context,
                            initialDate: widget.newPlanController.selectedDate,
                            firstDate: DateTime.parse(firstDate),
                            lastDate: DateTime.now().add(Duration(days: 360)));
                        if (chosenDate != null) {
                          widget.newPlanController.setDate(chosenDate);
                        }
                      },
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding * 0.75),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        child: Text(
                          DateFormat('MM월 dd일 E', 'ko')
                              .format(widget.newPlanController.selectedDate),
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: kBlackColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: defaultPadding,
              ),

              //TODO: Time Select Bar
              Row(
                children: [
                  // Time Icon
                  SizedBox(
                      height: 36, child: Image.asset('assets/time_icon.png')),
                  SizedBox(
                    width: defaultPadding,
                  ),

                  // Start Time
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      widget.newPlanController.setStartTime(14, 30);
                    },
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: defaultPadding,
                          vertical: defaultPadding * 0.75),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15)),
                      alignment: Alignment.center,
                      child: Text(
                        '${NumberFormat('00').format(widget.newPlanController.selectedStartTime[0])}시 ${NumberFormat('00').format(widget.newPlanController.selectedStartTime[1])}분',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: kBlackColor),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: defaultPadding,
                    child: Center(
                        child: Text(
                      '~',
                      style: TextStyle(fontSize: defaultPadding),
                    )),
                  ),

                  // End Time
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        widget.newPlanController.setEndTime(15, 0);
                      },
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding * 0.75),
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        child: Text(
                          '${NumberFormat('00').format(widget.newPlanController.selectedEndTime[0])}시 ${NumberFormat('00').format(widget.newPlanController.selectedEndTime[1])}분',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: kBlackColor),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: defaultPadding,
              ),

              //TODO: Color Select Bor
              Row(
                children: [
                  // Color Icon
                  SizedBox(
                      height: 36, child: Image.asset('assets/color_icon.png')),
                  SizedBox(
                    width: defaultPadding,
                  ),

                  // Color Box
                  Expanded(
                    child: InkWell(
                      onTap: () =>
                          widget.newPlanController.setColor(0xFF6AC259),
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding * 0.75),
                        decoration: BoxDecoration(
                            color:
                                Color(widget.newPlanController.selectedColor),
                            border: Border.all(color: kGrayColor),
                            borderRadius: BorderRadius.circular(15)),
                        alignment: Alignment.center,
                        child: Text(
                          '  ',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.transparent),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: defaultPadding,
              ),

              //TODO: Content Input Form
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(bottom: defaultPadding),
                child: Row(
                  children: [
                    SizedBox(
                      width: 36,
                      child: Image.asset('assets/pencil_icon.png'),
                    ),
                    SizedBox(width: defaultPadding),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: defaultPadding,
                            vertical: defaultPadding * 0.25),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextFormField(
                          onSaved: (val) =>
                              widget.newPlanController.setContent(val!),
                          maxLines: null,
                          expands: true,
                          cursorColor: kBlackColor,
                          decoration: InputDecoration(
                              hintText: '일정의 구체적인 내용을 적어주세요!',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        '새로운 일정',
        style:
            Theme.of(context).textTheme.headline5!.copyWith(color: kBlackColor),
      ),
      leading: BackButton(
        color: kBlackColor,
      ),
    );
  }
}
