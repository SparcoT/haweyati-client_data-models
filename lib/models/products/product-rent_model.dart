import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/model.dart';

part 'product-rent_model.g.dart';

@HiveType(typeId: 21)
@JsonSerializable(includeIfNull: false)
class ProductRent extends BaseModelHive {
  @HiveField(1) int days;
  @HiveField(2) String city;
  @HiveField(3) double rent;
  @HiveField(4) double helperPrice;
  @HiveField(5) double extraDayRent;

  ProductRent({
    this.city,
    this.rent = 0,
    this.days = 0,
    this.extraDayRent = 0,
    this.helperPrice = 0
  });

  Map<String, dynamic> toJson() => _$ProductRentToJson(this);
  factory ProductRent.fromJson(json) => _$ProductRentFromJson(json);
}
