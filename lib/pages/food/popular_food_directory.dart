// ignore_for_file: depend_on_referenced_packages, unused_import

import 'package:flutter/material.dart';
import 'package:fooddelivery/controllers/cart_controller.dart';
import 'package:fooddelivery/controllers/popular_product_controller.dart';
import 'package:fooddelivery/models/products_model.dart';
import 'package:fooddelivery/pages/home/mian_food_page.dart';
import 'package:fooddelivery/routes/route_helper.dart';
import 'package:fooddelivery/utils/app_constants.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimenstions.dart';
import 'package:fooddelivery/widget/app_column.dart';
import 'package:fooddelivery/widget/app_icon.dart';
import 'package:fooddelivery/widget/big_text.dart';
import 'package:fooddelivery/widget/expendable_text.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class PopularFoodDetail extends StatelessWidget {
  int pageId;
  PopularFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>());

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
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            '${AppConstants.BASE_URL}${AppConstants.UPLOD_URI}${product.img}'))),
              )),
          //Button Component
          Positioned(
              top: Dimensions.sizedBox45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getInitial());
                      },
                      child: AppIcon(icon: Icons.arrow_back)),
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
                    AppColumn(text: product.name),
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
                      child: SingleChildScrollView(
                        child: ExpandableText(text: product.description),
                      ),
                    )
                  ],
                ),
              )),
        ]),

        // Bottom navigation
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popularProduct) {
            return Container(
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
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              popularProduct.setQuantitly(false);
                            },
                            child: const Icon(
                              Icons.remove,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.sizedBox5,
                          ),
                          BigText(text: popularProduct.quantity.toString()),
                          SizedBox(
                            width: Dimensions.sizedBox5,
                          ),
                          GestureDetector(
                            onTap: () {
                              popularProduct.setQuantitly(true);
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.black54,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        popularProduct.addItem(product);
                      },
                      child: Container(
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
                      ),
                    )
                  ]),
            );
          },
        ));
  }
}
