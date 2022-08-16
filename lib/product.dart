import 'dart:ffi';
import 'dart:math';

import 'package:e_commerc_api/Rate.dart';

class product {
  int? id;
  String? title;
  num? price;
  String? description;
  String? category;
  String? image;
  Rate? rate;
  product.fromaMap(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    rate = Rate.fromMap(json['rating']);
    image = json['image'];
  }
  @override
  String toString() {
    return "$title- $id - $price";
  }
}
