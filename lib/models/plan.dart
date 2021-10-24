import 'package:daily_planner_app/constants.dart';

class Plan {
  late DateTime startTime, endTime;
  late String title, content, planId;
  late bool state;
  late int colorValue;

  Plan({
    required this.startTime,
    required this.endTime,
    required this.title,
    required this.content,
    required this.planId,
    this.state = false,
    this.colorValue = 0xFFf7cac9,
  });

  @override
  String toString() {
    return '\nTitle: ${this.title}\nStartTime: ${this.startTime}\nEndTime: ${this.endTime}\nContent: ${this.content}\nColorValue: ${this.colorValue}';
  }

  void nextPlanState() {
    this.state = !this.state;
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'planId': this.planId,
      'title': this.title,
      'content': this.content,
      'colorValue': this.colorValue.toRadixString(16),
      'startTime': this.startTime.millisecondsSinceEpoch,
      'endTime': this.endTime.millisecondsSinceEpoch,
      'state': this.state ? 1 : 0
    };
    return map;
  }

  Plan.fromMap(Map<String, dynamic> map) {
    this.planId = map['planId'] as String;
    this.title = map['title'] as String;
    this.content = map['content'] as String;
    this.colorValue = int.parse(map['colorValue'] as String, radix: 16);
    this.startTime =
        DateTime.fromMillisecondsSinceEpoch(map['startTime'] as int);
    this.endTime = DateTime.fromMillisecondsSinceEpoch(map['endTime'] as int);
    this.state = (map['state'] as int) == 1 ? true : false;
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
