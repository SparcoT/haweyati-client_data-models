import 'package:hive/hive.dart';
import '../image_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'vehicle-type.g.dart';

@HiveType(typeId: 3)
@JsonSerializable(explicitToJson: true)
class VehicleType extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  double volumetricWeight;
  @HiveField(2)
  ImageModel image;
  @HiveField(3)
  @JsonKey(name: "_id")
  String id;
  @HiveField(4)
  double deliveryCharges;
  @HiveField(5)
  double cbmHeight;
  @HiveField(6)
  double cbmLength;
  @HiveField(7)
  double cbmWidth;

  VehicleType({this.image,this.name,this.id,this.deliveryCharges,this.volumetricWeight
  ,this.cbmWidth,this.cbmLength,this.cbmHeight});

  Map<String, dynamic> toJson() => _$VehicleTypeToJson(this);
  factory VehicleType.fromJson(json) => _$VehicleTypeFromJson(json);

}