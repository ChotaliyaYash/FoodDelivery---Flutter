import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/dimenstions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final double iconSize;

  // ignore: prefer_const_constructors_in_immutables
  AppIcon(
      {super.key,
      required this.icon,
      this.backgroundColor = const Color(0xFFEBE2E2),
      this.iconColor = const Color(0xFF181616),
      this.size = 0,
      this.iconSize = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size == 0 ? Dimensions.sizedBox40 : size,
      height: size == 0 ? Dimensions.sizedBox40 : size,
      // width: size,
      // height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              size == 0 ? Dimensions.sizedBox40 / 2 : size / 2),
          color: backgroundColor),
      child: Icon(
        icon,
        color: iconColor,
        size: iconSize == 0 ? Dimensions.sizedBox15 : iconSize,
      ),
    );
  }
}
