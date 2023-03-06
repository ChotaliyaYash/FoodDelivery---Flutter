import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/dimenstions.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  final String text;
  final Color? color;
  double size;
  TextOverflow overFlow;
  BigText(
      {super.key,
      required this.text,
      this.size = 0,
      this.color = const Color(0xFF0d1b2a),
      this.overFlow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
          fontSize: size == 0 ? Dimensions.sizedBox20 : size),
    );
  }
}
