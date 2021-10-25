import 'package:daily_planner_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';

class DateSelectBar extends StatelessWidget {
  const DateSelectBar({
    Key? key,
    required this.date,
    required this.setDate,
  }) : super(key: key);

  final DateTime date;
  final ValueChanged<DateTime> setDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Date Icon
        SizedBox(
          height: getProportionateScreenHeight(rowIconSize),
          child: Image.asset(
            'assets/calendar_icon.png',
          ),
        ),
        HorizontalSpacing(),

        // Date(Month, Day, Weekday)
        Expanded(
          child: InkWell(
            onTap: () async {
              final chosenDate = await showDatePicker(
                  builder: (context, child) => Theme(
                        child: child!,
                        data: ThemeData.dark(),
                      ),
                  context: context,
                  initialDate: date,
                  firstDate: DateTime.parse(firstDate),
                  lastDate: DateTime.now().add(Duration(days: 360)));
              if (chosenDate != null) {
                setDate(chosenDate);
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
                  border: Border.all(),
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenHeight(15))),
              alignment: Alignment.center,
              child: Text(
                DateFormat('MM월 dd일 E', 'ko').format(date),
                style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: kBlackColor,
                    fontSize: getProportionateScreenHeight(headline6)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
