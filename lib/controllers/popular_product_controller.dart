// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:fooddelivery/controllers/cart_controller.dart';
import 'package:fooddelivery/data/repositories/popular_product_repo.dart';
import 'package:fooddelivery/models/products_model.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      // ignore: avoid_print
      print("Error detected in loading popular food");
    }
  }

  void setQuantitly(bool isIncrement) {
    if (isIncrement == true) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar("Item Count", "You can't remove more",
          backgroundColor: MyColor.peach, colorText: Colors.white);
      return 0;
    } else if (quantity > 20) {
      Get.snackbar("Item Count", "You can't add more",
          backgroundColor: MyColor.peach, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  initProduct(CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    // get from storage _inCartItems
  }

  void addItem(ProductModel product) {
    if (quantity > 0) {
      _cart.addItem(product, _quantity);
    } else {
      Get.snackbar("Cart Count", "You should add atleast one item in the cart",
          backgroundColor: MyColor.peach, colorText: Colors.white);
    }
  }
}
