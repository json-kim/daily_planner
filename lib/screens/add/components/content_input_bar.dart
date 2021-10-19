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
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: Row(
        children: [
          SizedBox(
            width: 36,
            child: Image.asset('assets/pencil_icon.png'),
          ),
          SizedBox(width: defaultPadding),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding * 0.25),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                initialValue: initialContent,
                onSaved: save,
                maxLines: null,
                expands: true,
                cursorColor: kBlackColor,
                decoration: InputDecoration(
                    hintText: '일정의 구체적인 내용을 적어주세요!', border: InputBorder.none),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
