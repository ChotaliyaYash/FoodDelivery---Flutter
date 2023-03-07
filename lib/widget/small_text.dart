import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/dimenstions.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  double size;
  double height;
  SmallText(
      {super.key,
      required this.text,
      this.size = 0,
      this.height = 1.2,
      this.color = const Color(0xFF9E9E9E)});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w400,
          fontSize: size == 0 ? Dimensions.sizedBox12 : size,
          height: height),
    );
  }
}
