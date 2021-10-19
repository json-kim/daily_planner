import 'package:flutter/material.dart';

import '../../../constants.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    Key? key,
    required this.press,
  }) : super(key: key);

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          bottom: defaultPadding, left: defaultPadding, right: defaultPadding),
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: defaultGradient, borderRadius: BorderRadius.circular(25)),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: null,
            primary: Colors.transparent,
            onSurface: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          onPressed: press,
          child: Text(
            'save'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .subtitle1!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
