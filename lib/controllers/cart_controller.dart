// ignore_for_file: depend_on_referenced_packages

import 'package:fooddelivery/data/repositories/cart_repository.dart';
import 'package:fooddelivery/models/cart_model.dart';
import 'package:fooddelivery/models/products_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});

  // ignore: prefer_final_fields
  Map<int, CartModel> _items = {};

  void addItem(ProductModel product, int quantity) {
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        return CartModel(
            id: value.id,
            name: value.name,
            img: value.img,
            price: value.price,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString());
      });
    } else {
      _items.putIfAbsent(product.id!, () {
        return CartModel(
            id: product.id,
            name: product.name,
            img: product.img,
            price: product.price,
            quantity: quantity,
            isExist: true,
            time: DateTime.now().toString());
      });
    }
  }
}
