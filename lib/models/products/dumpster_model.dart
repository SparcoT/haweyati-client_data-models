import 'package:haweyati_client_data_models/models/image_model.dart';
import 'package:hive/hive.dart';
import 'product-rent_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/data.dart';
import 'package:haweyati_client_data_models/models/order/order_model.dart';

part 'dumpster_model.g.dart';

@JsonSerializable(includeIfNull: false)
class Dumpster extends Purchasable {
  @HiveField(1)
  String size;
  @HiveField(2)
  ImageModel image;
  @HiveField(4)
  String description;
  @HiveField(3)
  List<ProductRent> pricing;

  Dumpster({this.size, this.image, this.description, this.pricing});

  int get days => pricing.first.days;
  double get rent => pricing.first.rent;
  double get extraDayRent => pricing.first.extraDayRent;

  Map<String, dynamic> toJson() => _$DumpsterToJson(this);
  factory Dumpster.fromJson(json) {
    print('started dumpster parsing');
    final dumpster = _$DumpsterFromJson(json);
    print(dumpster);
    print('ended dumpster parsing');

    dumpster.pricing = [
      dumpster.pricing.firstWhere((element) => element.city == AppData().city)
    ];

    return dumpster;
  }
}
