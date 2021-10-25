import 'package:daily_planner_app/constants.dart';
import 'package:flutter/material.dart';

// 개발 에뮬레이터 뷰포트 사이즈
final devEmulatorWidth = 428;
final devEmulatorHeight = 926;

// 현재 뷰포트의 MediaQueryData를 초기화하는 클래스
class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;
  static late EdgeInsets padding;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    padding = _mediaQueryData.padding;
  }
}

// 아래의 함수, 위젯을 사용하기 위해서는 SizeConfig.init() 메소드를 우선 실행해야 한다.

// 개발 에뮬레이터와 실제 작동 기기와의 크기 비율을 가지고 실제 기기에서 적당한 사이즈를 리턴
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;

  return inputHeight * (screenHeight / devEmulatorHeight);
}

double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;

  return inputWidth * (screenWidth / devEmulatorWidth);
}

// SizedBox를 실제 기기에 맞게 크기를 조정해주는 위젯
class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({Key? key, this.of = defaultPadding}) : super(key: key);

  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: getProportionateScreenHeight(of));
  }
}

class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing({Key? key, this.of = defaultPadding})
      : super(key: key);

  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(of),
    );
  }
}
