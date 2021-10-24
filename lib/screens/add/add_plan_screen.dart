import 'package:daily_planner_app/constants.dart';
import 'package:daily_planner_app/controllers/new_plan_controller.dart';
import 'package:daily_planner_app/controllers/plan_controller.dart';
import 'package:daily_planner_app/screens/planner/planner_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';

import 'components/color_select_bar.dart';
import 'components/content_input_bar.dart';
import 'components/date_select_bar.dart';
import 'components/save_button.dart';
import 'components/time_select_bar.dart';
import 'components/title_input_bar.dart';

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

      // Save Button
      bottomNavigationBar: SaveButton(
        press: () {
          final result = widget.newPlanController.planSave();
          if (result == null) return;
          if (result) {
            Get.back(result: widget.newPlanController.isEdit);
          } else {
            Get.snackbar('실패', '저장에 실패하였습니다.');
          }
        },
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Form(
          key: widget.newPlanController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: defaultPadding * 0.5,
              ),

              // Title Input Form
              TitleInputBar(
                save: (val) => widget.newPlanController.setTitle(val!),
                initialTitle: widget.newPlanController.title,
              ),
              SizedBox(
                height: defaultPadding,
              ),

              // Date Select Bar
              DateSelectBar(
                  date: widget.newPlanController.selectedDate,
                  setDate: widget.newPlanController.setDate),
              SizedBox(
                height: defaultPadding,
              ),

              // Time Select Bar
              TimeSelectBar(
                startTime: widget.newPlanController.selectedStartTime,
                endTime: widget.newPlanController.selectedEndTime,
                setStartTime: widget.newPlanController.setStartTime,
                setEndTime: widget.newPlanController.setEndTime,
                isTimeError: widget.newPlanController.isTimeError,
              ),
              SizedBox(
                height: defaultPadding,
              ),

              // Color Select Bar
              ColorSelectBar(
                  colorValue: widget.newPlanController.selectedColor,
                  setColor: widget.newPlanController.setColor),
              SizedBox(
                height: defaultPadding,
              ),

              // Content Input Bar
              Expanded(
                  child: ContentInputBar(
                save: (val) => widget.newPlanController.setContent(val!),
                initialContent: widget.newPlanController.content,
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
