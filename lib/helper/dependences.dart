// ignore_for_file: depend_on_referenced_packages

import 'package:fooddelivery/controllers/popular_product_controller.dart';
import 'package:fooddelivery/controllers/recommended_product_controller.dart';
import 'package:fooddelivery/data/api/api_client.dart';
import 'package:fooddelivery/data/repositories/popular_product_repo.dart';
import 'package:fooddelivery/data/repositories/recommended_product_repository.dart';
import 'package:fooddelivery/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //Api c;ient
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));
  // repo
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  // Controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
}
