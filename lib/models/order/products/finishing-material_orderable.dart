import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/models/order/order_model.dart';
import 'package:haweyati_client_data_models/models/products/finishing-material_model.dart';

part 'finishing-material_orderable.g.dart';

@JsonSerializable()
class FinishingMaterialOrderable extends OrderableProduct<FinishingMaterial> {
  @HiveField(1)
  int qty;
  @HiveField(2)
  double price;
  @HiveField(3)
  Map<String, dynamic> variants;

  FinishingMaterialOrderable({
    FinishingMaterial product,
    this.qty,
    this.price,
    this.variants,
  }) : super(product);

  Map<String, dynamic> toJson() => _$FinishingMaterialOrderableToJson(this);
  factory FinishingMaterialOrderable.fromJson(json) =>
      _$FinishingMaterialOrderableFromJson(json);
}
