import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    Key? key,
    required this.press,
    required this.imgSrc,
    required this.size,
    required this.paddingSize,
    required this.radius,
  }) : super(key: key);

  final VoidCallback press;
  final String imgSrc;
  final double size;
  final double paddingSize;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(radius),
      onTap: press,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingSize),
        child: Image.asset(
          imgSrc,
          width: size,
        ),
      ),
    );
  }
}
