import 'package:daily_planner_app/controllers/plan_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DateController extends GetxController {
  late List<DateTime> _dates;
  List<DateTime> get dates => _dates;

  late DateTime _selectedDate;
  DateTime get selectedDate => _selectedDate;

  int getSelectedDateIndex() {
    final idx = _dates.indexWhere((date) {
      if (isSameDate(date, _selectedDate)) return true;
      return false;
    });
    return idx;
  }

  @override
  void onInit() {
    _selectedDate = DateTime.now();
    _dates = List.generate(14,
        (index) => startDayOfWeek(DateTime.now()).add(Duration(days: index)));
    super.onInit();
  }

  static bool isSameDate(DateTime one, DateTime two) {
    if (one.year == two.year && one.month == two.month && one.day == two.day)
      return true;

    return false;
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;

    PlanController _planController = Get.put(PlanController());
    _planController.selectPlansWithDate(_selectedDate);
    update();
  }

  DateTime startDayOfWeek(DateTime date) {
    return date.subtract(Duration(days: date.weekday - 1));
  }

  void addWeeksToDates({int numOfWeeks = 2, bool isAfter = true}) {
    final lastDate = _dates[_dates.length - 1];
    final firstDate = _dates[0];

    for (int i = 1; i <= 7 * numOfWeeks; i++) {
      if (isAfter) {
        _dates.add(lastDate.add(Duration(days: i)));
      } else {
        _dates.insert(0, firstDate.subtract(Duration(days: i)));
      }
    }

    update();
  }
}
