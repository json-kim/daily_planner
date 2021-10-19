import 'package:daily_planner_app/controllers/date_controller.dart';
import 'package:daily_planner_app/models/plan.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class PlanController extends GetxController {
  DateController? _dateController = Get.put(DateController());
  DateController get dateController => _dateController!;

  List<Plan> _plans = List.generate(sampleData.length, (index) {
    final plan = sampleData[index];
    return Plan(
        startTime: DateTime.parse(plan['startTime']),
        endTime: DateTime.parse(plan['endTime']),
        planId: plan['planId'],
        title: plan['title'],
        content: plan['content']);
  }).obs;
  List<Plan> get plans => this._plans;

  List<Plan>? _selectedPlans;
  List<Plan> get selectedPlans => this._selectedPlans!;

  @override
  void onInit() {
    selectPlansWithDate(DateTime.now());
    super.onInit();
  }

  void addPlan(Plan plan) {
    _plans.add(plan);
    selectPlansWithDate(_dateController!.selectedDate);
  }

  void replacePlan(Plan oldPlan, newPlan) {
    final idx = _plans.indexOf(oldPlan);
    _plans[idx] = newPlan;
    selectPlansWithDate(_dateController!.selectedDate);
  }

  void planStateChange(Plan plan) {
    plan.nextPlanState();
    update();
  }

  void selectPlansWithDate(DateTime date) {
    final List<Plan> datePlans = [];

    _plans.forEach((plan) {
      if (plan.startTime.day == date.day) {
        datePlans.add(plan);
      }
    });

    _selectedPlans = datePlans;
    update();
  }

  bool deletePlan(Plan plan) {
    final result = _plans.remove(plan);
    selectPlansWithDate(_dateController!.selectedDate);
    update();

    return result;
  }
}
