import 'package:flutter/material.dart';
import 'package:fooddelivery/pages/food/popular_food_directory.dart';
// ignore: unused_import
import 'package:fooddelivery/pages/home/mian_food_page.dart';
// ignore: depend_on_referenced_packages
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MainFoodPage(),
      home: const PopularFoodDetail(),
    );
  }
}
