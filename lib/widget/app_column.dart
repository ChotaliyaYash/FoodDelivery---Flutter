import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimenstions.dart';
import 'package:fooddelivery/widget/big_text.dart';
import 'package:fooddelivery/widget/icon_and_text.dart';
import 'package:fooddelivery/widget/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment
          .start, // to justify the start, end (justification) of the axis
      children: [
        BigText(text: text),
        SizedBox(
          height: Dimensions.sizedBox10,
        ),
        Row(
          children: [
            Wrap(
              // it is use to generate stars
              children: List.generate(
                  // it denerats 5 similer items and return widgets
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: MyColor.peach,
                        size: Dimensions.sizedBox15,
                      )),
            ),
            SizedBox(
              width: Dimensions.sizedBox10,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: Dimensions.sizedBox10,
            ),
            SmallText(text: "1023"),
            SizedBox(
              width: Dimensions.sizedBox10,
            ),
            SmallText(text: "Comments")
          ],
        ),
        SizedBox(
          height: Dimensions.sizedBox20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndText(
                text: "Normal",
                icon: Icons.circle_sharp,
                iconColor: Color.fromARGB(255, 246, 191, 129)),
            IconAndText(
                text: "17Km",
                icon: Icons.location_on,
                iconColor: Color.fromARGB(255, 142, 236, 145)),
            IconAndText(
                text: "32min",
                icon: Icons.access_time_rounded,
                iconColor: Color.fromARGB(255, 246, 136, 128))
          ],
        )
      ],
    );
  }
}
