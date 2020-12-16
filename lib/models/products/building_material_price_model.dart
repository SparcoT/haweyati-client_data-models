import 'package:json_annotation/json_annotation.dart';

part 'building_material_price_model.g.dart';

@JsonSerializable(includeIfNull: false)
class BMPrice {
  @JsonKey(name: '_id')
  String id;
  String unit;
  double price;

  BMPrice({this.id, this.price, this.unit});

  factory BMPrice.fromJson(json) => _$BMPriceFromJson(json);

  Map<String, dynamic> toJson() => _$BMPriceToJson(this);
}
