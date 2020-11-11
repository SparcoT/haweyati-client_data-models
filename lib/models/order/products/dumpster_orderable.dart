import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/models/order/order_model.dart';
import 'package:haweyati_client_data_models/models/products/dumpster_model.dart';

part 'dumpster_orderable.g.dart';

@HiveType(typeId: 51)
@JsonSerializable()
class DumpsterOrderable extends OrderableProduct<Dumpster> {
  @HiveField(3) int qty;
  @HiveField(1) int extraDays;
  @HiveField(2) double extraDaysPrice;

  DumpsterOrderable({
    Dumpster product,
    this.qty = 1,
    this.extraDays = 0,
    this.extraDaysPrice = 0
  }): super(product);

  Map<String, dynamic> toJson() => _$DumpsterOrderableToJson(this);
  factory DumpsterOrderable.fromJson(json) {
    final dumpster = _$DumpsterOrderableFromJson(json);

    print(dumpster);
    print(dumpster.qty);
    print(dumpster.product);

    return dumpster;
  }
}