import 'package:haweyati_client_data_models/model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'coupon-model.g.dart';

@JsonSerializable()
class Coupon extends BaseModelHive{
  String name;
  String code;
  double value;
  Coupon({this.name,this.value,this.code});

  Map<String, dynamic> toJson() => _$CouponToJson(this);
  factory Coupon.fromJson(json) => _$CouponFromJson(json);
}