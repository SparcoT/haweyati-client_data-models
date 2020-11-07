import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/models/order/order_model.dart';
import 'package:haweyati_client_data_models/models/products/building-material_model.dart';

part 'building-material_orderable.g.dart';

@HiveType(typeId: 52)
@JsonSerializable(includeIfNull: false)
class BuildingMaterialOrderable extends OrderableProduct<BuildingMaterial> {
  @HiveField(1) int qty;
  @HiveField(3) double price;
  @HiveField(2) BuildingMaterialSize size;

  BuildingMaterialOrderable(this.size, {
    BuildingMaterial product,
    this.qty = 0,
    this.price = 0.0,
  }): super(product);

  Map<String, dynamic> toJson() => _$BuildingMaterialOrderableToJson(this);
  factory BuildingMaterialOrderable.fromJson(Map<String, dynamic> json) {
    return _$BuildingMaterialOrderableFromJson(json);
  }
}
