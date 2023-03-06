import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/dimenstions.dart';
import 'package:fooddelivery/widget/small_text.dart';

class IconAndText extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color iconColor;
  const IconAndText(
      {super.key,
      required this.text,
      required this.icon,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: Dimensions.sizedBox25,
        ),
        SizedBox(
          width: Dimensions.sizedBox5,
        ),
        SmallText(
          text: text,
        )
      ],
    );
  }
}
