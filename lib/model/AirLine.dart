class AirLine {
  int? id;
  String? name;
  String? country;
  String? logo;
  String? slogan;
  String? head_quaters;
  String? website;
  String? established;

  AirLine(this.country, this.established, this.head_quaters, this.id, this.logo,
      this.name, this.slogan, this.website);

  AirLine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    country = json['country'];
    logo = json['logo'];
    slogan = json['slogan'];
    head_quaters = json['head_quaters'];
    website = json['website'];
    established = json['established'];
  }
}
