import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimenstions.dart';
import 'package:fooddelivery/widget/app_column.dart';
import 'package:fooddelivery/widget/app_icon.dart';
import 'package:fooddelivery/widget/big_text.dart';
import 'package:fooddelivery/widget/expendable_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        // Image Component
        Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.sizedBox350,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/food0.jpeg"))),
            )),
        //Button Component
        Positioned(
            top: Dimensions.sizedBox45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            )),
        //Text Container
        Positioned(
            top: Dimensions.sizedBox350 - 20,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.sizedBox20,
                  right: Dimensions.sizedBox20,
                  top: Dimensions.sizedBox20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.sizedBox20),
                      topRight: Radius.circular(Dimensions.sizedBox20)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppColumn(text: "Burger"),
                  SizedBox(
                    height: Dimensions.sizedBox20,
                  ),
                  BigText(text: "Introduce"),
                  SizedBox(
                    height: Dimensions.sizedBox15,
                  ),
                  // Expandabe text widget
                  // ignore: prefer_const_constructors
                  Expanded(
                    child: const SingleChildScrollView(
                      child: ExpandableText(
                        text:
                            "A hamburger, or simply burger, is a sandwich consisting of fillings—usually a patty of ground meat, typically beef—placed inside a sliced bun or bread roll. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a \"special sauce,\" often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger patty topped with cheese is called a cheeseburger.\nThe term burger can also be applied to the meat patty on its own, especially in the United Kingdom, where the term patty is rarely used or can even refer to ground beef. Since the term hamburger usually implies beef, for clarity burger may be prefixed with the type of meat or meat substitute used, as in beef burger, turkey burger, bison burger, portobello burger, or veggie burger. In Australia and New Zealand, a piece of chicken breast on a bun is known as a chicken burger, which would generally not be considered to be a burger in the United States; Americans would generally call it a chicken sandwich, but in Australian English and New Zealand English a sandwich requires sliced bread (not a bun), so it would not be considered a sandwich",
                      ),
                    ),
                  )
                ],
              ),
            )),
      ]),

      // Bottom navigation
      bottomNavigationBar: Container(
        height: Dimensions.pageViewTextContainer,
        padding: EdgeInsets.only(
            top: Dimensions.sizedBox30,
            bottom: Dimensions.sizedBox30,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.sizedBox20 * 2),
                topRight: Radius.circular(Dimensions.sizedBox20 * 2)),
            color: MyColor.seashell),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.only(
                top: Dimensions.sizedBox20,
                bottom: Dimensions.sizedBox20,
                left: Dimensions.sizedBox20,
                right: Dimensions.sizedBox20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.sizedBox20),
                color: Colors.white),
            child: Row(
              children: [
                const Icon(
                  Icons.remove,
                  color: Colors.black54,
                ),
                SizedBox(
                  width: Dimensions.sizedBox5,
                ),
                BigText(text: "0"),
                SizedBox(
                  width: Dimensions.sizedBox5,
                ),
                const Icon(
                  Icons.add,
                  color: Colors.black54,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: Dimensions.sizedBox20,
                bottom: Dimensions.sizedBox20,
                left: Dimensions.sizedBox20,
                right: Dimensions.sizedBox20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.sizedBox20),
                color: MyColor.peach),
            child: BigText(
              text: "₹60 | Add to cart",
              color: Colors.white,
            ),
          )
        ]),
      ),
    );
  }
}
