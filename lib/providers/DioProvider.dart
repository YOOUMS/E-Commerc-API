import 'package:e_commerc_api/helpers/dioHelper.dart';

import 'package:flutter/cupertino.dart';

import '../model/product.dart';

class DioProvider extends ChangeNotifier {
  List<Product>? products;
  DioProvider() {
    getProducts();
  }

  getProducts() async {
    products = await dioHelper.diohelper.getAllProducts();
    notifyListeners();
  }
}
