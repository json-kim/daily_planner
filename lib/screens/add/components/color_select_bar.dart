import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

import '../../../constants.dart';

class ColorSelectBar extends StatelessWidget {
  const ColorSelectBar({
    Key? key,
    required this.colorValue,
    required this.setColor,
  }) : super(key: key);

  final int colorValue;
  final ValueChanged<int> setColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Color Icon
        SizedBox(height: 36, child: Image.asset('assets/color_icon.png')),
        SizedBox(
          width: defaultPadding,
        ),

        // Color Box
        Expanded(
          child: InkWell(
            onTap: () async {
              final chosenColor = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        content: SingleChildScrollView(
                          child: BlockPicker(
                              pickerColor: Color(defaultColorInt),
                              onColorChanged: (color) {
                                Get.back<Color>(result: color);
                              }),
                        ),
                      ));
              if (chosenColor != null) {
                setColor(chosenColor.value);
              }
            },
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding, vertical: defaultPadding * 0.75),
              decoration: BoxDecoration(
                  color: Color(colorValue),
                  border: Border.all(color: kGrayColor),
                  borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              child: Text(
                '  ',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(color: Colors.transparent),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
