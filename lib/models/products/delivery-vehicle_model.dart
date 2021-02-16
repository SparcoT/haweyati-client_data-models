import 'package:haweyati_client_data_models/models/image_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/data.dart';
import 'package:haweyati_client_data_models/models/order/order_model.dart';
part 'delivery-vehicle_model.g.dart';

@JsonSerializable(includeIfNull: false)
class DeliveryVehicle extends Purchasable {
  @HiveField(1)
  String name;
  @HiveField(2)
  ImageModel image;
  @HiveField(3)
  double volumetricWeight;
  @HiveField(7)
  double deliveryCharges;
  @HiveField(8)
  double cbmHeight;
  @HiveField(9)
  double cbmLength;
  @HiveField(10)
  double cbmWidth;
  DeliveryVehicle({this.name, this.image,
    this.cbmWidth,this.cbmLength,this.cbmHeight,
    this.deliveryCharges,
    this.volumetricWeight});

  Map<String, dynamic> toJson() => _$DeliveryVehicleToJson(this);
  factory DeliveryVehicle.fromJson(json) => _$DeliveryVehicleFromJson(json);
  
}
