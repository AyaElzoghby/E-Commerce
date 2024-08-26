import 'package:e_commerce/widgets/product_details.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  List selectedProducts = [];
  double Price = 0;
  add(Product item) {
    selectedProducts.add(item);
    Price += item.Price.round();
    notifyListeners();
  }

  delete(Product item) {
    selectedProducts.remove(item);
    Price -= item.Price.round();
    notifyListeners();
  }
}
