import 'dart:developer';

import 'package:dio/dio.dart';

import '../model/product.dart';

class dioHelper {
  dioHelper._();
  static dioHelper diohelper = dioHelper._();
  Dio dio = Dio();

  getAllProducts() async {
    Response response = await dio.get("https://fakestoreapi.com/products");
    List dataList = response.data;
    List<Product> products = dataList
        .map(
          (e) => Product.fromaMap(e),
        )
        .toList();
    return products;
  }
}
