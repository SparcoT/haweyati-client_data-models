import 'package:haweyati_client_data_models/common/json_serializable.dart';
import 'package:hive/hive.dart';

part 'pricing_model.g.dart';

@HiveType(typeId: 15)
class BuildingMaterialPricing extends HiveObject implements JsonSerializable {
  @HiveField(0) String id;
  @HiveField(1) String city;
  @HiveField(2) double price20yard;
  @HiveField(3) double price12yard;

  BuildingMaterialPricing({
    this.city,
    this.price12yard,
    this.price20yard
  });

  BuildingMaterialPricing.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    city = json['city'];
    price12yard = double.parse(json['price12yard'].toString());
    price20yard = double.parse(json['price20yard'].toString());
  }

  @override
  Map<String, dynamic> serialize() => {
    'city': city,
    'price12yard': price12yard,
    'price20yard': price20yard,
  };

  Map<String, dynamic> toJson() => serialize();
}
