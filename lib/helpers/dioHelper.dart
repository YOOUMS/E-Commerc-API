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

    return product;
  }

  createPost(PostRequest postRequest) async {
    Response response = await dio.post(
        'https://jsonplaceholder.typicode.com/posts',
        data: postRequest.toJson());
  }

  Future<String> logIn(String username, String password) async {
    Map<String, dynamic> map = {
      'scope': 'offline_access',
      'grant_type': 'password',
      'username': username,
      'password': password,
      'client_id': "0oahdhjkutaGcIK2M4x6"
    };
    Response response = await dio.post(
        'https://dev-457931.okta.com/oauth2/aushd4c95QtFHsfWt4x6/v1/token',
        queryParameters: map,
        options: Options(headers: {
          'Host': 'dev-457931.okta.com',
          'Content-Type': 'application/x-www-form-urlencoded'
        }));

    return response.data['access_token'];
  }

  Future<List<Passenger>> getAllPassengers(String token, [int page = 0]) async {
    token = token.toString().trim();
    log('inside getallpasengers$token');
    Response response = await dio.get(
        'https://api.instantwebtools.net/v2/passenger',
        queryParameters: {'size': 10, 'page': page},
        options: Options(headers: {'Authorization': 'Bearer ${token}'}));

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
