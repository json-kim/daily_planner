import 'package:daily_planner_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class TitleInputBar extends StatelessWidget {
  const TitleInputBar({Key? key, required this.save, this.initialTitle = ''})
      : super(key: key);

  final ValueChanged<String?>? save;
  final String initialTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon
        Container(
          width: getProportionateScreenHeight(rowIconSize),
          child: FittedBox(
            child: Text(
              'Title'.toUpperCase(),
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: kBlackColor,
                  fontSize: getProportionateScreenHeight(subtitle2)),
            ),
          ),
        ),
        HorizontalSpacing(),

        // Title Input Form
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
                left: getProportionateScreenWidth(defaultPadding),
                right: getProportionateScreenWidth(defaultPadding),
                bottom: getProportionateScreenHeight(3)),
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius:
                    BorderRadius.circular(getProportionateScreenHeight(15))),
            child: TextFormField(
              initialValue: initialTitle,
              validator: (val) {
                if (val == null || val.length == 0) {
                  return '제목을 입력해주세요!';
                } else if (val.length > 30) {
                  return '제목은 30자 이하로 작성해주세요! 현재 ${val.length}자';
                }
              },
              style:
                  TextStyle(fontSize: getProportionateScreenHeight(subtitle1)),
              onSaved: save,
              cursorColor: kBlackColor,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '일정의 제목을 적어주세요!',
                  hintStyle: TextStyle(
                      fontSize: getProportionateScreenHeight(subtitle1))),
            ),
          ),
        ),
      ],
    );
  }
}
