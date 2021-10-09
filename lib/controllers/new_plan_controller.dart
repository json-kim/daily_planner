import 'package:daily_planner_app/constants.dart';
import 'package:daily_planner_app/controllers/date_controller.dart';
import 'package:daily_planner_app/controllers/plan_controller.dart';
import 'package:daily_planner_app/models/plan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class NewPlanController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  get formKey => this._formKey;

  String? _title;
  String get title => this._title!;

  String? _content;
  String get content => this._content!;

  late DateTime _selectedDate;
  DateTime get selectedDate => this._selectedDate;

  List<int> _selectedStartTime = [0, 0];
  List<int> get selectedStartTime => this._selectedStartTime;

  List<int> _selectedEndTime = [24, 0];
  List<int> get selectedEndTime => this._selectedEndTime;

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

  void setStartTime(int hour, int minute) {
    if (hour < 0 || hour > 24 || minute < 0 || minute > 59) return;

    this._selectedStartTime[0] = hour;
    this._selectedStartTime[1] = minute;

    update();
  }

  void setEndTime(int hour, int minute) {
    if (hour < 0 || hour > 24 || minute < 0 || minute > 59) return;

    this._selectedEndTime[0] = hour;
    this._selectedEndTime[1] = minute;

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
        selectedDate.day, selectedStartTime[0], selectedStartTime[1]);
    final endTime = DateTime(selectedDate.year, selectedDate.month,
        selectedDate.day, selectedEndTime[0], selectedEndTime[1]);
    final newPlan = Plan(
        startTime: startTime,
        endTime: endTime,
        title: title,
        content: content,
        colorValue: selectedColor,
        planId: ValueKey(DateTime.now()).toString());

    PlanController planController = Get.put(PlanController());
    planController.addPlan(newPlan);

    return true;
  }
}
