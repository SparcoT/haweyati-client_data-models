import 'package:haweyati_client_data_models/models/products/single-scaffolding_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/models/order/order_model.dart';

part 'single-scaffolding_orderable.g.dart';

@HiveType(typeId: 51)
@JsonSerializable()
class SingleScaffoldingOrderable extends OrderableProduct<SingleScaffolding> {
  @HiveField(1) int qty;
  @HiveField(2) int days;
  @HiveField(3) int wheels;
  @HiveField(4) int connections;
  @HiveField(5) String mesh;
  @HiveField(6) int meshQty;

  SingleScaffoldingOrderable({
    SingleScaffolding product,
    this.qty = 1,
    this.days = 0,
    this.wheels= 0,
    this.connections=0,
    this.mesh,
    this.meshQty= 1,
  }): super(product);

  Map<String, dynamic> toJson() => _$SingleScaffoldingOrderableToJson(this);
  factory SingleScaffoldingOrderable.fromJson(json)=> _$SingleScaffoldingOrderableFromJson(json);

}