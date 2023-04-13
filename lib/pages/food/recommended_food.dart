// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:fooddelivery/controllers/recommended_product_controller.dart';
import 'package:fooddelivery/routes/route_helper.dart';
import 'package:fooddelivery/utils/app_constants.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimenstions.dart';
import 'package:fooddelivery/widget/app_icon.dart';
import 'package:fooddelivery/widget/big_text.dart';
import 'package:fooddelivery/widget/expendable_text.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RecommendedFoodDetail extends StatelessWidget {
  int pageId;
  RecommendedFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // effect to image and description
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: Dimensions.hight70,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.getInitial());
                    },
                    child: AppIcon(icon: Icons.clear)),
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
                  text: product.name,
                  size: Dimensions.font26,
                )),
              ),
            ),
            pinned: true,
            backgroundColor: MyColor.peach,
            expandedHeight: Dimensions.sizedBox350,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                "${AppConstants.BASE_URL}${AppConstants.UPLOD_URI}${product.img}",
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
                    child: ExpandableText(text: product.description)),
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
                  BigText(
                      text: "₹${product.price} X 0", size: Dimensions.font26),
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
                      text: "₹${product.price} | Add to cart",
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
