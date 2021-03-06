import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'location_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 127)
class Location {
  @HiveField(0) String city;
  @HiveField(1) String address;
  @HiveField(2) double latitude;

  @HiveField(3) double longitude;

  Location({
    this.city,
    this.address,
    this.latitude,
    this.longitude
  });

  Map<String, dynamic> toJson() => _$LocationToJson(this);
  factory Location.fromJson(json) {
    json['latitude'] = double.parse(json['latitude']?.toString() ?? '0.0');
    json['longitude'] = double.parse(json['longitude']?.toString() ?? '0.0');
    var loc = _$LocationFromJson(json);
    return loc;
  }
}