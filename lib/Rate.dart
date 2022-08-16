class Rate {
  num? rate;
  int? count;
  Rate.fromMap(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }
}
