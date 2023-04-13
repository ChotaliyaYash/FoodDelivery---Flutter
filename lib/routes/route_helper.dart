// ignore_for_file: depend_on_referenced_packages

import 'package:fooddelivery/pages/food/popular_food_directory.dart';
import 'package:fooddelivery/pages/food/recommended_food.dart';
import 'package:fooddelivery/pages/home/mian_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static String initial = "/";
  static String popularFood = "/popular-food";
  static String recommendedFood = "/recommended-food";

  static String getInitial() => initial;
  static String getPopularFood(int pageId) => "$popularFood?pageId=$pageId";
  static String getRecommendedFood(int pageId) =>
      "$recommendedFood?pageId=$pageId";

  static List<GetPage> routes = [
    // Initial route Details
    GetPage(
        name: initial,
        page: () {
          return const MainFoodPage();
        },
        transition: Transition.fadeIn),
    // popular food details
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
    // Recommended Food details
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommendedFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.fadeIn),
  ];
}
