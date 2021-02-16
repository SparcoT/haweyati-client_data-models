import 'package:haweyati_client_data_models/models/products/delivery-vehicle_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'delivery-fee.g.dart';

@JsonSerializable()
class DeliveryFee {
  double deliveryFee;
  DeliveryVehicle vehicle;
  double distance;

  DeliveryFee({
    this.deliveryFee,
    this.vehicle,
    this.distance,
  });

  Map<String, dynamic> toJson() => _$DeliveryFeeToJson(this);
  factory DeliveryFee.fromJson(json) => _$DeliveryFeeFromJson(json);
}