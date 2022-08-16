import 'package:e_commerc_api/dioHelper.dart';
import 'package:e_commerc_api/product.dart';
import 'package:flutter/cupertino.dart';

class DioProvider extends ChangeNotifier {
  List<product>? products;
  DioProvider() {
    getProducts();
  }

  getProducts() async {
    products = await dioHelper.diohelper.getAllProducts();
    notifyListeners();
  }
}
