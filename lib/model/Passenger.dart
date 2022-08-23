import 'AirLine.dart';

class Passenger {
  String? _id;
  String? name;
  int? trips = 100;

  List<AirLine>? airLine;

  Passenger(this._id, this.airLine, this.name, this.trips);

  Passenger.fromJson(Map<String, dynamic> json) {
    _id = json['_id'];
    name = json['name'];
    trips = json['trips'];
    airLine = json['airline'];
  }
}
