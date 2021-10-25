import 'package:daily_planner_app/size_config.dart';
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
        SizedBox(
            height: getProportionateScreenHeight(rowIconSize),
            child: Image.asset('assets/color_icon.png')),
        HorizontalSpacing(),

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
            borderRadius:
                BorderRadius.circular(getProportionateScreenHeight(15)),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(defaultPadding),
                  vertical:
                      getProportionateScreenHeight(defaultPadding * 0.75)),
              decoration: BoxDecoration(
                  color: Color(colorValue),
                  border: Border.all(color: kGrayColor),
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenHeight(15))),
              alignment: Alignment.center,
              child: Text(
                '  ',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.transparent,
                    fontSize: getProportionateScreenHeight(headline6)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
