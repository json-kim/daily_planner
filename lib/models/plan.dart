import 'package:daily_planner_app/constants.dart';

enum PlanState {
  now_ing,
  done,
  cancled,
  move_back,
}

class Plan {
  final DateTime startTime, endTime;
  final String title, content, planId;
  PlanState state;
  int colorValue;

  Plan({
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.content,
    required this.planId,
    this.state = PlanState.now_ing,
    this.colorValue = 0xFFf7cac9,
  });

  @override
  String toString() {
    return '\nTitle: ${this.title}\nStartTime: ${this.startTime}\nEndTime: ${this.endTime}\nContent: ${this.content}\nColorValue: ${this.colorValue}';
  }

  void nextPlanState() {
    switch (this.state) {
      case PlanState.now_ing:
        this.state = PlanState.done;
        break;
      case PlanState.done:
        this.state = PlanState.cancled;
        break;
      case PlanState.cancled:
        this.state = PlanState.move_back;
        break;
      case PlanState.move_back:
        this.state = PlanState.now_ing;
        break;
    }
  }
}

List sampleData = [
  {
    "startTime": "2021-10-07 07:00:00",
    "endTime": "2021-10-07 08:00:00",
    "title": "Morning Running",
    "content": "1 hour running challenge",
    "planId": "djaflksjfl34df",
  },
  {
    "startTime": "2021-10-07 10:00:00",
    "endTime": "2021-10-07 14:00:00",
    "title": "Flutter Class",
    "content": "Class at Semin School",
    "planId": "djaflksjfl34d534f",
  },
  {
    "startTime": "2021-10-07 18:00:00",
    "endTime": "2021-10-07 19:00:00",
    "title": "Dinner Meeting",
    "content": "Meeting with my teammate",
    "planId": "djaf123lksjfl34df",
  },
  {
    "startTime": "2021-10-08 07:00:00",
    "endTime": "2021-10-08 08:00:00",
    "title": "Morning Running",
    "content": "1 hour running challenge",
    "planId": "djaflksjfl34df",
  },
  {
    "startTime": "2021-10-08 10:00:00",
    "endTime": "2021-10-08 14:00:00",
    "title": "Flutter Class 2",
    "content": "Class at Semin School",
    "planId": "djaflksjfl34d534f",
  },
  {
    "startTime": "2021-10-08 18:00:00",
    "endTime": "2021-10-08 19:00:00",
    "title": "Dinner Meeting",
    "content": "Meeting with my teammate",
    "planId": "djaf123lksjfl34df",
  },
];
