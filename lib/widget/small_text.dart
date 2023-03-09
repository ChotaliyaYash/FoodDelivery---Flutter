import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/dimenstions.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  double size;
  double height;
  TextOverflow overFlow;
  bool overFlowCheck;
  SmallText(
      {super.key,
      required this.text,
      this.size = 0,
      this.height = 1.2,
      this.color = const Color(0xFF9E9E9E),
      this.overFlow = TextOverflow.ellipsis,
      this.overFlowCheck = false});

  @override
  Widget build(BuildContext context) {
    return overFlowCheck
        ? Text(
            text,
            maxLines: 1,
            overflow: overFlow,
            style: TextStyle(
                color: color,
                fontWeight: FontWeight.w400,
                fontSize: size == 0 ? Dimensions.sizedBox12 : size,
                height: height),
          )
        : Text(
            text,
            style: TextStyle(
                color: color,
                fontWeight: FontWeight.w400,
                fontSize: size == 0 ? Dimensions.sizedBox12 : size,
                height: height),
          );
  }
}
