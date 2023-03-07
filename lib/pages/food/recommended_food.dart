import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimenstions.dart';
import 'package:fooddelivery/widget/app_icon.dart';
import 'package:fooddelivery/widget/big_text.dart';
import 'package:fooddelivery/widget/expendable_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // effect to image and description
          SliverAppBar(
            toolbarHeight: Dimensions.hight70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.clear,
                ),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.sizedBox20),
              child: Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(
                    top: Dimensions.sizedBox5, bottom: Dimensions.sizedBox10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(Dimensions.sizedBox20),
                      topLeft: Radius.circular(Dimensions.sizedBox20)),
                  color: Colors.white,
                ),
                child: Center(
                    child: BigText(
                  text: "Burger King",
                  size: Dimensions.font26,
                )),
              ),
            ),
            pinned: true,
            backgroundColor: MyColor.peach,
            expandedHeight: Dimensions.sizedBox350,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food3.jpeg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Sliver to Box
          SliverToBoxAdapter(
            child: Column(
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.sizedBox20,
                      right: Dimensions.sizedBox20),
                  child: const ExpandableText(
                      text:
                          "A hamburger, or simply burger, is a sandwich consisting of fillings—usually a patty of ground meat, typically beef—placed inside a sliced bun or bread roll. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a \"special sauce,\" often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger patty topped with cheese is called a cheeseburger.\nThe term burger can also be applied to the meat patty on its own, especially in the United Kingdom, where the term patty is rarely used or can even refer to ground beef. Since the term hamburger usually implies beef, for clarity burger may be prefixed with the type of meat or meat substitute used, as in beef burger, turkey burger, bison burger, portobello burger, or veggie burger. In Australia and New Zealand, a piece of chicken breast on a bun is known as a chicken burger, which would generally not be considered to be a burger in the United States; Americans would generally call it a chicken sandwich, but in Australian English and New Zealand English a sandwich requires sliced bread (not a bun), so it would not be considered a sandwich.\n\nA hamburger, or simply burger, is a sandwich consisting of fillings—usually a patty of ground meat, typically beef—placed inside a sliced bun or bread roll. Hamburgers are often served with cheese, lettuce, tomato, onion, pickles, bacon, or chilis; condiments such as ketchup, mustard, mayonnaise, relish, or a \"special sauce,\" often a variation of Thousand Island dressing; and are frequently placed on sesame seed buns. A hamburger patty topped with cheese is called a cheeseburger.\nThe term burger can also be applied to the meat patty on its own, especially in the United Kingdom, where the term patty is rarely used or can even refer to ground beef. Since the term hamburger usually implies beef, for clarity burger may be prefixed with the type of meat or meat substitute used, as in beef burger, turkey burger, bison burger, portobello burger, or veggie burger. In Australia and New Zealand, a piece of chicken breast on a bun is known as a chicken burger, which would generally not be considered to be a burger in the United States; Americans would generally call it a chicken sandwich, but in Australian English and New Zealand English a sandwich requires sliced bread (not a bun), so it would not be considered a sandwich."),
                ),
              ],
            ),
          )
        ],
      ),
      // Bottom navigation bar
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Add and price section
          Container(
            padding: EdgeInsets.only(
                left: Dimensions.sizedBox20 * 2.5,
                right: Dimensions.sizedBox20 * 2.5,
                top: Dimensions.sizedBox10,
                bottom: Dimensions.sizedBox10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(
                    icon: Icons.remove,
                    backgroundColor: MyColor.peach,
                    iconSize: Dimensions.sizedBox25,
                  ),
                  BigText(text: "₹60 X 0", size: Dimensions.font26),
                  AppIcon(
                    icon: Icons.add,
                    backgroundColor: MyColor.peach,
                    iconSize: Dimensions.sizedBox25,
                  ),
                ]),
          ),
          // checkout section
          Container(
            height: Dimensions.pageViewTextContainer,
            padding: EdgeInsets.only(
                top: Dimensions.sizedBox20,
                bottom: Dimensions.sizedBox20,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.sizedBox20 * 2),
                    topRight: Radius.circular(Dimensions.sizedBox20 * 2)),
                color: MyColor.seashell),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(
                          top: Dimensions.sizedBox20,
                          bottom: Dimensions.sizedBox20,
                          left: Dimensions.sizedBox20,
                          right: Dimensions.sizedBox20),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.sizedBox20),
                          color: Colors.white),
                      child: const Icon(
                        Icons.favorite,
                        color: MyColor.peach,
                      )),
                  Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.sizedBox20,
                        bottom: Dimensions.sizedBox20,
                        left: Dimensions.sizedBox20,
                        right: Dimensions.sizedBox20),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.sizedBox20),
                        color: MyColor.peach),
                    child: BigText(
                      text: "₹60 | Add to cart",
                      color: Colors.white,
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
