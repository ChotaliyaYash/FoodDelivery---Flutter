// ignore_for_file: depend_on_referenced_packages, duplicate_ignore, sized_box_for_whitespace, unused_import

import 'package:flutter/material.dart';
import 'package:fooddelivery/controllers/popular_product_controller.dart';
import 'package:fooddelivery/controllers/recommended_product_controller.dart';
import 'package:fooddelivery/models/products_model.dart';
import 'package:fooddelivery/pages/food/popular_food_directory.dart';
import 'package:fooddelivery/routes/route_helper.dart';
import 'package:fooddelivery/utils/app_constants.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimenstions.dart';
import 'package:fooddelivery/widget/app_column.dart';
import 'package:fooddelivery/widget/big_text.dart';
import 'package:fooddelivery/widget/icon_and_text.dart';
import 'package:fooddelivery/widget/small_text.dart';
// ignore: depend_on_referenced_packages
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  // it is used to add an next page some part to the same thing using viewpoartfraction value 1.0 is default value.
  // below code is for zoom in and zoom out of the surrounding factors
  var _currentPageValue = 0.0;
  final _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;
  // print(Dimensions.screenHeight);.

// for page number
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ignore: sized_box_for_whitespace
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  height: Dimensions.pageView,
                  child: PageView.builder(
                    controller: pageController,
                    // page view builder is use to build an app for sliding bar, in  the direction of horizental
                    itemBuilder: (context, position) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getPopularFood(position));
                        },
                        child: _buildPageItem(position,
                            popularProducts.popularProductList[position]),
                      );
                    },
                    itemCount: popularProducts
                        .popularProductList.length, // number of sliding windows
                  ),
                )
              : const CircularProgressIndicator(
                  color: MyColor.peach,
                );
        }),
        // creating page marker using dots_indicator
        // ignore: unnecessary_new
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductList.isEmpty
                ? 1
                : popularProducts.popularProductList.length,
            position: _currentPageValue,
            decorator: DotsDecorator(
              activeColor: MyColor.peach,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimensions.sizedBox5)),
            ),
          );
        }),

        SizedBox(height: Dimensions.sizedBox30),
        // Popular Text
        _popularText(),

        // List of food and images
        GetBuilder<RecommendedProductController>(
            builder: (recommendedProducts) {
          return recommendedProducts.isLoaded
              ? _listContainer(recommendedProducts)
              : const CircularProgressIndicator(
                  color: MyColor.peach,
                );
        }),
        // ),
      ],
    );
  }

// List of many items
  ListView _listContainer(RecommendedProductController recommendedProducts) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: recommendedProducts.recommendedProductList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getRecommendedFood(index));
            },
            child: Container(
                margin: EdgeInsets.only(
                    left: Dimensions.sizedBox20,
                    right: Dimensions.sizedBox20,
                    bottom: Dimensions.sizedBox10),
                child: Row(
                  children: [
                    // Image Section
                    Container(
                      width: Dimensions.listViewImageSize,
                      height: Dimensions.pageViewTextContainer,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.sizedBox20),
                          color: Colors.white38,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "${AppConstants.BASE_URL}${AppConstants.UPLOD_URI}${recommendedProducts.recommendedProductList[index].img!}"))),
                    ),
                    // Text container
                    _textContainer(
                        recommendedProducts.recommendedProductList[index])
                  ],
                )),
          );
        });
  }

// Text Container
  Expanded _textContainer(ProductModel recommendedProduct) {
    return Expanded(
      child: Container(
        height: Dimensions.sizedBox100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(Dimensions.sizedBox20),
                topRight: Radius.circular(Dimensions.sizedBox20)),
            color: Colors.white),
        child: Padding(
          padding: EdgeInsets.only(
              left: Dimensions.sizedBox10, right: Dimensions.sizedBox10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigText(text: recommendedProduct.name!),
              SizedBox(
                height: Dimensions.sizedBox10,
              ),
              SmallText(
                text: recommendedProduct.description!,
                overFlowCheck: true,
              ),
              SizedBox(
                height: Dimensions.sizedBox10,
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
          ),
        ),
      ),
    );
  }

// Popular text contianer
  Container _popularText() {
    return Container(
      margin: EdgeInsets.only(left: Dimensions.sizedBox30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          BigText(text: "Recommended"),
          SizedBox(
            width: Dimensions.sizedBox10,
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            margin: const EdgeInsets.only(bottom: 3),
            child: BigText(
              text: ".",
              color: Colors.black26,
            ),
          ),
          SizedBox(
            width: Dimensions.sizedBox10,
          ),
          // ignore: avoid_unnecessary_containers
          Container(
            margin: const EdgeInsets.only(bottom: 2),
            child: SmallText(text: "Food pairing"),
          )
        ],
      ),
    );
  }

//creating a slider with cool effects
  Widget _buildPageItem(int index, ProductModel popularProduct) {
    // below code is for zoom in and zoom out of the other cards, this is done using matrix
    // ignore: unnecessary_new
    Matrix4 matrix = new Matrix4.identity();

    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currentTransform = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTransform, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 0);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        // it is use to put an object one object above another object, on one container can over lap with another container
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimensions.sizedBox10, right: Dimensions.sizedBox10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.sizedBox30),
                color: index.isEven ? MyColor.paledogwood : MyColor.apricot,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "${AppConstants.BASE_URL}${AppConstants.UPLOD_URI}${popularProduct.img!}"))),
          ),
          Align(
            // use to change the alignment of the image over another another image, we can change overlap container direction
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.sizedBox30,
                  right: Dimensions.sizedBox30,
                  bottom: Dimensions.sizedBox30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.sizedBox30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xffe8e8e8),
                        blurRadius: Dimensions.sizedBox5,
                        offset: Offset(0, Dimensions.sizedBox5)),
                    const BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    const BoxShadow(color: Colors.white, offset: Offset(5, 0))
                  ]),
              child: _pageItemName(index, popularProduct),
            ),
          )
        ],
      ),
    );
  }

// Slidebar items display
  Widget _pageItemName(int index, ProductModel popularProduct) {
    // ignore: avoid_unnecessary_containers
    return Container(
        padding: EdgeInsets.only(
            top: Dimensions.sizedBox15,
            left: Dimensions.sizedBox15,
            right: Dimensions.sizedBox15),
        child: AppColumn(text: popularProduct.name!));
  }
}
