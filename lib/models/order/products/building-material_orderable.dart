import 'package:haweyati_client_data_models/models/products/building_material_price_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/models/order/order_model.dart';
import 'package:haweyati_client_data_models/models/products/building-material_model.dart';

part 'building-material_orderable.g.dart';

@HiveType(typeId: 52)
@JsonSerializable(includeIfNull: false)
class BuildingMaterialOrderable extends OrderableProduct<BuildingMaterial> {
  @HiveField(1) int qty;
  @HiveField(2) BMPrice price;

  BuildingMaterialOrderable({
    BuildingMaterial product,
    this.qty = 0,
    this.price,

  }): super(product);

  Map<String, dynamic> toJson() => _$BuildingMaterialOrderableToJson(this);
  factory BuildingMaterialOrderable.fromJson(Map<String, dynamic> json) {
    return _$BuildingMaterialOrderableFromJson(json);
  }
}
