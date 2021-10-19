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
        Container(
          width: 36,
          child: FittedBox(
            child: Text(
              'Title'.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(color: kBlackColor),
            ),
          ),
        ),
        SizedBox(width: defaultPadding),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding * 0.25),
            decoration: BoxDecoration(
                border: Border.all(), borderRadius: BorderRadius.circular(15)),
            child: TextFormField(
              initialValue: initialTitle,
              validator: (val) {
                if (val == null || val.length == 0) {
                  return '제목을 입력해주세요!';
                } else if (val.length > 30) {
                  return '제목은 30자 이하로 작성해주세요! 현재 ${val.length}자';
                }
              },
              onSaved: save,
              cursorColor: kBlackColor,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '일정의 제목을 적어주세요!',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
