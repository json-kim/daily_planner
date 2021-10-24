import 'package:daily_planner_app/models/plan.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String tablePlan = 'plan';
final String columnId = 'planId';

class DBController {
  var _path;
  late Database _db;

  static final instance = DBController();

  Future<void> initDB() async {
    try {
      final databasepath = await getDatabasesPath();
      _path = join(databasepath, 'daily_planner.db');

      _db =
          await openDatabase(_path, version: 1, onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $tablePlan (
              planId TEXT PRIMARY KEY, 
              title TEXT NOT NULL, 
              content TEXT NOT NULL, 
              colorValue TEXT NOT NULL,
              startTime INTEGER NOT NULL,
              endTime INTEGER NOT NULL,
              state INTEGER NOT NULL
              )''');
      });
    } catch (e) {
      print('DBContoller.initDB() error occurred');
    }
  }

  Future<void> closeDB() async {
    try {
      await _db.close();
    } catch (e) {
      print('DBController.closeDB() error occurred');
    }
  }

  Future<void> deleteDB() async {
    try {
      await deleteDatabase(_path);
    } catch (e) {
      print('DBController.deleteDB() error occurred');
    }
  }

  Future<List<Plan>> loadTable() async {
    final List<Plan> planList = [];

    try {
      List<Map<String, dynamic>> maps = await _db.query(
        tablePlan,
        columns: [
          'planId',
          'title',
          'content',
          'colorValue',
          'startTime',
          'endTime',
          'state'
        ],
      );

      maps.forEach((map) {
        final plan = Plan.fromMap(map);
        planList.add(plan);
      });
    } catch (e) {
      print('DBController.loadTalbe() error occurred');
    }

    return planList;
  }

  Future<void> saveTable(List<Plan> plans) async {
    plans.forEach((Plan plan) {
      try {
        _db.insert(tablePlan, plan.toMap());
      } catch (e) {
        print('DBController.saveTable() error occurred! at Plan:$plan');
      }
    });
  }

  Future<void> deleteTable() async {
    try {
      _db.delete(tablePlan);
    } catch (e) {
      print('DBController.deleteTable() error occurred!');
    }
  }

  Future<bool> insertToTable(Plan plan) async {
    try {
      _db.insert(tablePlan, plan.toMap());
    } catch (e) {
      print('DBController.insertToTable() error occurred! at Plan:$plan');
      return false;
    }
    return true;
  }

  Future<bool> deleteFromTable(Plan plan) async {
    try {
      final result = await _db
          .delete(tablePlan, where: 'planId = ?', whereArgs: [plan.planId]);
      print('talbe delete result is $result');
    } catch (e) {
      print(
          'DBController.deleteFromTable(Plan plan) error eccured! at Plan:$plan');
      return false;
    }
    return true;
  }

  Future<bool> updateToTable(Plan plan) async {
    try {
      final result = _db.update(
        tablePlan,
        plan.toMap(),
        where: 'planId = ?',
        whereArgs: [plan.planId],
      );
      print('table update result is $result');
    } catch (e) {
      print(
          'DBController.updateToTable(Plan plan) error occurred! at Plan:$plan');
      return false;
    }
    return true;
  }
}
