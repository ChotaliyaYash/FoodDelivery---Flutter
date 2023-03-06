import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimenstions.dart';
import 'package:fooddelivery/widget/big_text.dart';
import 'package:fooddelivery/widget/icon_and_text.dart';
import 'package:fooddelivery/widget/small_text.dart';
// ignore: depend_on_referenced_packages
import 'package:dots_indicator/dots_indicator.dart';

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
  // print(Dimensions.screenHeight);

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
        Container(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            // page view builder is use to build an app for sliding bar, in  the direction of horizental
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
            itemCount: 5, // number of sliding windows
          ),
        ),
        // creating page marker using dots_indicator
        // ignore: unnecessary_new
        new DotsIndicator(
          dotsCount: 5,
          position: _currentPageValue,
          decorator: DotsDecorator(
            activeColor: MyColor.peach,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Dimensions.sizedBox5)),
          ),
        )
      ],
    );
  }

//creating a slider with cool effects
  Widget _buildPageItem(int index) {
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
                image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/food2.jpeg"))),
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
              child: _pageItemName(index),
            ),
          )
        ],
      ),
    );
  }

// Slidebar items display
  Widget _pageItemName(int index) {
    // ignore: avoid_unnecessary_containers
    return Container(
        padding: EdgeInsets.only(
            top: Dimensions.sizedBox15,
            left: Dimensions.sizedBox15,
            right: Dimensions.sizedBox15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // to justify the start, end (justification) of the axis
          children: [
            BigText(text: "Cake"),
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
        ));
  }
}
