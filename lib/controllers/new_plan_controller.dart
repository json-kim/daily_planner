import 'package:daily_planner_app/constants.dart';
import 'package:daily_planner_app/controllers/date_controller.dart';
import 'package:daily_planner_app/controllers/plan_controller.dart';
import 'package:daily_planner_app/models/plan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NewPlanController extends GetxController {
  NewPlanController() {
    this._title = '';
    this._content = '';
    _isEdit = false;
  }

  NewPlanController.fromPlan({required this.plan}) {
    _title = plan!.title;
    _content = plan!.content;
    _selectedDate = plan!.startTime;
    _selectedStartTime =
        TimeOfDay(hour: plan!.startTime.hour, minute: plan!.startTime.minute);
    _selectedEndTime =
        TimeOfDay(hour: plan!.endTime.hour, minute: plan!.endTime.minute);
    _selectedColor = plan!.colorValue;
    _isEdit = true;
  }
  Plan? plan;

  late bool _isEdit;
  bool get isEdit => _isEdit;

  final _formKey = GlobalKey<FormState>();
  get formKey => this._formKey;

  String? _title;
  String get title => this._title!;

  String? _content;
  String get content => this._content!;

  late DateTime _selectedDate;
  DateTime get selectedDate => this._selectedDate;

  TimeOfDay _selectedStartTime = TimeOfDay(hour: 0, minute: 0);
  TimeOfDay get selectedStartTime => this._selectedStartTime;

  TimeOfDay _selectedEndTime = TimeOfDay(hour: 12, minute: 0);
  TimeOfDay get selectedEndTime => this._selectedEndTime;

  int _selectedColor = defaultColorInt;
  int get selectedColor => this._selectedColor;

  @override
  void onInit() {
    DateController _dateController = Get.put(DateController());
    _selectedDate = _dateController.selectedDate;
    super.onInit();
  }

  void setTitle(String inputTitle) {
    this._title = inputTitle;
    update();
  }

  void setContent(String inputContent) {
    this._content = inputContent;
    update();
  }

  void setDate(DateTime date) {
    this._selectedDate = date;
    update();
  }

  void setStartTime(TimeOfDay startTime) {
    this._selectedStartTime = startTime;

    update();
  }

  void setEndTime(TimeOfDay endTime) {
    this._selectedEndTime = endTime;

    update();
  }

  void setColor(int inputColor) {
    this._selectedColor = inputColor;

    update();
  }

  bool planSave() {
    if (!_formKey.currentState!.validate()) {
      return false;
    }
    _formKey.currentState!.save();

    final startTime = DateTime(selectedDate.year, selectedDate.month,
        selectedDate.day, selectedStartTime.hour, selectedStartTime.minute);
    final endTime = DateTime(selectedDate.year, selectedDate.month,
        selectedDate.day, selectedEndTime.hour, selectedEndTime.minute);
    final newPlan = Plan(
        startTime: startTime,
        endTime: endTime,
        title: title,
        content: content,
        colorValue: selectedColor,
        planId: _isEdit ? plan!.planId : ValueKey(DateTime.now()).toString());

    PlanController planController = Get.put(PlanController());

    if (this._isEdit) {
      // TODO: 기존의 플랜 수정하기
      planController.replacePlan(plan!, newPlan);
    } else {
      planController.addPlan(newPlan);
    }

    return true;
  }
}
