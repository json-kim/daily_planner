import 'package:daily_planner_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ContentInputBar extends StatelessWidget {
  const ContentInputBar(
      {Key? key, required this.save, this.initialContent = ''})
      : super(key: key);

  final ValueChanged<String?>? save;
  final String initialContent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: getProportionateScreenHeight(defaultPadding)),
      child: Row(
        children: [
          // Icon
          SizedBox(
            width: getProportionateScreenHeight(rowIconSize),
            child: Image.asset('assets/pencil_icon.png'),
          ),
          HorizontalSpacing(),

          // Content Input Form
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(defaultPadding),
                  vertical:
                      getProportionateScreenHeight(defaultPadding * 0.25)),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius:
                    BorderRadius.circular(getProportionateScreenHeight(15)),
              ),
              child: TextFormField(
                initialValue: initialContent,
                onSaved: save,
                maxLines: null,
                expands: true,
                cursorColor: kBlackColor,
                style: TextStyle(
                    fontSize: getProportionateScreenHeight(subtitle1)),
                decoration: InputDecoration(
                    hintText: '일정의 구체적인 내용을 적어주세요!',
                    hintStyle: TextStyle(
                        fontSize: getProportionateScreenHeight(subtitle1)),
                    border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
