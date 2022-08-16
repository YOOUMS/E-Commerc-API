import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerc_api/product.dart';

class dioHelper {
  dioHelper._();
  static dioHelper diohelper = dioHelper._();
  Dio dio = Dio();

  getAllProducts() async {
    Response response = await dio.get("https://fakestoreapi.com/products");
    List dataList = response.data;
    List<product> products = dataList
        .map(
          (e) => product.fromaMap(e),
        )
        .toList();
    return products;
  }
}
