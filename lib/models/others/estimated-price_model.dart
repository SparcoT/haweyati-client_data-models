import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'estimated-price_model.g.dart';

@JsonSerializable()
class EstimatedPrice {
  @HiveField(0) double distance;
  @HiveField(1) double price;

  EstimatedPrice({
    this.distance,
    this.price
  });

  Map<String, dynamic> toJson() => _$EstimatedPriceToJson(this);
  factory EstimatedPrice.fromJson(json) => _$EstimatedPriceFromJson(json);
}