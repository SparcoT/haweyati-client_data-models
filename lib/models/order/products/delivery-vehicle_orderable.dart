import 'package:haweyati_client_data_models/models/others/location_model.dart';
import 'package:haweyati_client_data_models/models/products/delivery-vehicle_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/models/order/order_model.dart';
part 'delivery-vehicle_orderable.g.dart';

@HiveType(typeId: 51)
@JsonSerializable()
class DeliveryVehicleOrderable extends OrderableProduct<DeliveryVehicle> {
  @HiveField(1) int qty;
  // @HiveField(2) double pricePerKm;
  // @HiveField(3) double total;
  @HiveField(4) double distance;
  @HiveField(5) Location pickUpLocation;

  DeliveryVehicleOrderable({
    DeliveryVehicle product,
    this.qty = 1,
    // this.pricePerKm = 0,
    this.pickUpLocation
  }): super(product);

  Map<String, dynamic> toJson() => _$DeliveryVehicleOrderableToJson(this);
  factory DeliveryVehicleOrderable.fromJson(json) => _$DeliveryVehicleOrderableFromJson(json);

}