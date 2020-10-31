import 'package:haweyati_client_data_models/common/json_serializable.dart';
import 'package:hive/hive.dart';

part 'location_model.g.dart';

@HiveType(typeId: 103)
class Location extends HiveObject implements JsonSerializable {
  @HiveField(0)
  String city;
  @HiveField(1)
  String address;
  @HiveField(2)
  double latitude;
  @HiveField(3)
  double longitude;

  Location({
    this.city,
    this.address,
    this.latitude,
    this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      city: json['city'],
      address: json['address'],
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }

  @override
  Map<String, dynamic> serialize() => {
        'city': city,
        'longitude': longitude,
        'address': address,
        'latitude': latitude,
      };
}
