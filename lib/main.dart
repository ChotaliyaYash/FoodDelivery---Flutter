// ignore_for_file: unused_import, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:fooddelivery/controllers/popular_product_controller.dart';
import 'package:fooddelivery/pages/food/popular_food_directory.dart';
import 'package:fooddelivery/pages/food/recommended_food.dart';
import 'package:fooddelivery/pages/home/mian_food_page.dart';
import 'package:get/get.dart';
import 'package:fooddelivery/helper/dependences.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainFoodPage(),
      // home: const PopularFoodDetail(),
      // home: const RecommendedFoodDetail(),
    );
  }
}
