import 'package:daily_planner_app/controllers/plan_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DateController extends GetxController {
  late List<DateTime> _dates;
  List<DateTime> get dates => _dates;

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;

  @override
  void onInit() {
    _dates = List.generate(14,
        (index) => startDayOfWeek(DateTime.now()).add(Duration(days: index)));
    super.onInit();
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

  void addOneWeeksToDates() {
    final lastDate = _dates[-1];

    for (int i = 1; i <= 7; i++) {
      _dates.add(lastDate.add(Duration(days: i)));
    }

    update();
  }
}
