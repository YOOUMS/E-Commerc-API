import 'dart:developer';

import 'package:e_commerc_api/AppRouter.dart';
import 'package:e_commerc_api/helpers/dioHelper.dart';
import 'package:e_commerc_api/model/Passenger.dart';
import 'package:e_commerc_api/model/PostRequset.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';

class DioProvider extends ChangeNotifier {
  List<Product>? products;
  List<dynamic> cat = [];
  List<Product> catProducts = [];
  int? selectedIndex;
  Product? selectedProduct;
  int page = 0;
  List<Passenger> passegers = [];
  bool isLoaded = true;

  DioProvider() {
    getProducts();
    getAllCat();
    getProductsFor('all');
    getPassengers();
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

  getOneProduct(String id) async {
    selectedProduct = await dioHelper.diohelper.getOneProduct(id);
    notifyListeners();
  }

  creatPost() {
    PostRequest postRequest = PostRequest('body post', 'title post', 1);
    dioHelper.diohelper.createPost(postRequest);
  }

  getPassengers() async {
    ChangeLoadingStatus();
    passegers.addAll(await dioHelper.diohelper.getAllPassengers(page));
    notifyListeners();
    ChangeLoadingStatus();
  }

  loadMore() {
    page++;
    getPassengers();
  }

  ChangeLoadingStatus() {
    isLoaded = !isLoaded;
    notifyListeners();
  }
}
