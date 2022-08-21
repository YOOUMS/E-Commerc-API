import 'dart:developer';

import 'package:e_commerc_api/helpers/dioHelper.dart';

import 'package:flutter/cupertino.dart';

import '../model/product.dart';

class DioProvider extends ChangeNotifier {
  List<Product>? products;
  List<dynamic> cat = [];
  List<Product> catProducts = [];
  int? selectedIndex;
  DioProvider() {
    getProducts();
    getAllCat();
    getProductsFor('all');
  }

  getProducts() async {
    products = await dioHelper.diohelper.getAllProducts();
    notifyListeners();
  }

  getAllCat() async {
    cat = await dioHelper.diohelper.getAllCat();
    notifyListeners();
  }

  getProductsFor(String cat) async {
    if (cat == 'all') {
      selectedIndex = -1;
      catProducts = await dioHelper.diohelper.getAllProducts();
    } else {
      selectedIndex = this.cat.indexOf(cat);

      catProducts = await dioHelper.diohelper.getAllCatForSpcefi(cat);
    }

    notifyListeners();
  }
}
