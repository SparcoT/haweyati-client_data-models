import 'package:haweyati_client_data_models/models/order/order_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'product-rent_model.dart';

part 'dumpster_model.g.dart';

@JsonSerializable(includeIfNull: false)
class Dumpster extends Purchasable {
  @HiveField(1) String size;
  @HiveField(2) String image;
  @HiveField(4) String description;
  @HiveField(3) List<ProductRent> pricing;

  Dumpster({this.size, this.image, this.description, this.pricing});

  Map<String, dynamic> toJson() => _$DumpsterToJson(this);
  factory Dumpster.fromJson(json) => _$DumpsterFromJson(json);
}
