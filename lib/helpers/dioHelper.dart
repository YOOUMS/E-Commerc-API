import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:e_commerc_api/model/AirLine.dart';
import 'package:e_commerc_api/model/Passenger.dart';
import 'package:e_commerc_api/model/PostRequset.dart';

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

  getAllCat() async {
    Response response =
        await dio.get('https://fakestoreapi.com/products/categories');
    List cat = response.data;
    return cat;
  }

  getAllCatForSpcefi(String cat) async {
    Response response =
        await dio.get("https://fakestoreapi.com/products/category/$cat");
    List dataList = response.data;
    List<Product> products = dataList
        .map(
          (e) => Product.fromaMap(e),
        )
        .toList();
    return products;
  }

  getOneProduct(String id) async {
    Response response = await dio.get('https://fakestoreapi.com/products/$id');
    Product product = Product.fromaMap(response.data);
    log(product.toString());
    return product;
  }

  createPost(PostRequest postRequest) async {
    Response response = await dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        data: postRequest.toJson());
    log(response.statusCode.toString());
  }

  Future<List<Passenger>> getAllPassengers([int page = 0]) async {
    Response response = await dio.get(
        'https://api.instantwebtools.net/v1/passenger',
        queryParameters: {'size': 10, 'page': page});
    List data = response.data['data'];
    List<Passenger> passengers = data.map((e) {
      List airlinesData = e['airline'];

      List<AirLine> airlines = airlinesData.map((e) {
        return AirLine.fromJson(e);
      }).toList();

      e['airline'] = airlines;

      return Passenger.fromJson(e);
    }).toList();

    return passengers;
  }
}
