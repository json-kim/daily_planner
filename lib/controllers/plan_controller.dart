import 'package:daily_planner_app/controllers/date_controller.dart';
import 'package:daily_planner_app/controllers/db_controller.dart';
import 'package:daily_planner_app/models/plan.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class PlanController extends GetxController {
  DBController dbCont = DBController.instance;

  List<Plan> _plans = [];
  List<Plan> get plans => this._plans;

  List<Plan>? _selectedPlans = [];
  List<Plan> get selectedPlans => this._selectedPlans!;

  @override
  void onInit() {
    loadLocalTable();
    super.onInit();
  }

  Future<void> loadLocalTable() async {
    await dbCont.initDB();
    final loadPlanList = await dbCont.loadTable();
    _plans = loadPlanList.obs;
    selectPlansWithDate(DateTime.now());
    update();
  }

  Future<void> addPlan(Plan plan) async {
    final result = await dbCont.insertToTable(plan);
    if (!result) {
      return;
    }
    _plans.add(plan);

    DateController _dateController = Get.put(DateController());
    selectPlansWithDate(_dateController.selectedDate);
  }

  void replacePlan(Plan oldPlan, newPlan) async {
    final result = await dbCont.updateToTable(oldPlan);
    if (!result) {
      return;
    }

    final idx = _plans.indexWhere((plan) {
      if (plan.planId == oldPlan.planId) return true;
      return false;
    });
    _plans[idx] = newPlan;

    DateController _dateController = Get.put(DateController());
    selectPlansWithDate(_dateController.selectedDate);
  }

  void planStateChange(Plan plan) {
    plan.nextPlanState();
    update();
  }

  Future<bool> deletePlan(Plan plan) async {
    final dbResult = await dbCont.deleteFromTable(plan);
    if (!dbResult) {
      return false;
    }

    final result = _plans.remove(plan);

    DateController _dateController = Get.put(DateController());
    selectPlansWithDate(_dateController.selectedDate);
    update();

    return result;
  }

  void selectPlansWithDate(DateTime date) {
    final List<Plan> datePlans = [];

    _plans.forEach((plan) {
      if (DateController.isSameDate(plan.startTime, date)) {
        datePlans.add(plan);
      }
    });
    datePlans.sort(
      (Plan a, Plan b) => a.startTime.millisecondsSinceEpoch
          .compareTo(b.startTime.millisecondsSinceEpoch),
    );
    _selectedPlans = datePlans;
    update();
  }
}
