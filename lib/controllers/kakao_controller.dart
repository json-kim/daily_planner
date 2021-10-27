import 'package:daily_planner_app/constants.dart';
import 'package:daily_planner_app/models/plan.dart';
import 'package:intl/intl.dart';
import 'package:kakao_flutter_sdk/link.dart';

class KakaoController {
  bool _isKakaoTalkInstalled = false;

  static void init() {
    KakaoContext.clientId = kakaoAppKey;
  }

  Future _initKakaoInstalled() async {
    try {
      _isKakaoTalkInstalled = await isKakaoTalkInstalled();
    } catch (e) {}
  }

  Future share(Plan plan) async {
    await _initKakaoInstalled();

    if (_isKakaoTalkInstalled) {
      await _shareWithKakaoTalk(plan);
    } else {
      await _shareWithWeb(plan);
    }
  }

  Future _shareWithKakaoTalk(Plan plan) async {
    try {
      Uri uri = await LinkClient.instance.customWithTalk(64253, templateArgs: {
        '\${plan_title}': '${plan.title}',
        '\${plan_date}': '${DateFormat('yyyy-M-d E').format(plan.startTime)}',
        '\${plan_start_time}':
            '${DateFormat('hh:mm a').format(plan.startTime)}',
        '\${plan_end_time}': '${DateFormat('hh:mm a').format(plan.endTime)}',
        '\${plan_content}': '${plan.content}',
      });
      await launchBrowserTab(uri);
    } catch (e) {}
  }

  Future _shareWithWeb(Plan plan) async {
    try {
      Uri uri = await LinkClient.instance.customWithWeb(64253, templateArgs: {
        '\${plan_title}': '${plan.title}',
        '\${plan_date}': '${DateFormat('yyyy-M-d E').format(plan.startTime)}',
        '\${plan_start_time}':
            '${DateFormat('hh:mm a').format(plan.startTime)}',
        '\${plan_end_time}': '${DateFormat('hh:mm a').format(plan.endTime)}',
        '\${plan_content}': '${plan.content}',
      });
      await launchBrowserTab(uri);
    } catch (e) {}
  }
}
