import 'package:flutter/material.dart';
import 'package:fooddelivery/pages/home/food_page_body.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimenstions.dart';
import 'package:fooddelivery/widget/big_text.dart';
import 'package:fooddelivery/widget/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ignore: avoid_unnecessary_containers
          _header(), // header of the home app
          const Expanded(
              child: SingleChildScrollView(
                  child: FoodPageBody())) // body of the homepage
        ],
      ),
    );
  }

  Widget _header() {
    // ignore: avoid_unnecessary_containers
    return Container(
      // ignore: avoid_unnecessary_containers
      child: Container(
        margin: EdgeInsets.only(
            top: Dimensions.sizedBox45, bottom: Dimensions.sizedBox15),
        padding: EdgeInsets.only(
            left: Dimensions.sizedBox20, right: Dimensions.sizedBox20),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.spaceBetween, // use to seprate two components
          children: [
            Column(
              children: [
                BigText(
                  text: "Gujarat",
                  color: MyColor.peach,
                ),
                Row(children: [
                  SmallText(
                    text: "Ahmedabad",
                    color: Colors.black87,
                  ),
                  const Icon(Icons.arrow_drop_down_rounded)
                ])
              ],
            ),
            Center(
              child: Container(
                width: Dimensions.sizedBox45,
                height: Dimensions.sizedBox45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.sizedBox15),
                    color: MyColor.peach),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: Dimensions.sizedBox25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
