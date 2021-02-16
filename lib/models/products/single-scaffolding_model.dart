import 'package:haweyati_client_data_models/models/products/single-scaffolding-pricing_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/data.dart';
import 'package:haweyati_client_data_models/models/order/order_model.dart';
import 'mesh-type_model.dart';
part 'single-scaffolding_model.g.dart';
@JsonSerializable(includeIfNull: false)
class SingleScaffolding extends Purchasable {
  @HiveField(1)
  String type;
  @HiveField(2)
  String description;
  @HiveField(3)
  List<SingleScaffoldingPricing> pricing;
  @HiveField(4)
  double volumetricWeight;
  @HiveField(5)
  double cbmHeight;
  @HiveField(6)
  double cbmLength;
  @HiveField(7)
  double cbmWidth;
  SingleScaffolding({this.cbmHeight,this.cbmLength,this.cbmWidth, this.type,this.description,this.pricing,this.volumetricWeight});

  int get days => pricing.first.days;
  double get rent => pricing.first.rent;
  Mesh get mesh => pricing.first.mesh;
  double get extraDayRent => pricing.first.extraDayRent;
  double get wheels => pricing.first.wheels;
  double get connections => pricing.first.connections;
  double meshPrice (String type) => type == 'half' ? mesh.half : mesh.full;

  Map<String, dynamic> toJson() => _$SingleScaffoldingToJson(this);
  factory SingleScaffolding.fromJson(json) {
    print(json);
    final dumpster = _$SingleScaffoldingFromJson(json);

    dumpster.pricing = [
      dumpster.pricing.firstWhere((element) => element.city == AppData().city)
    ];

    return dumpster;
  }
}
