import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/model.dart';
import 'package:haweyati_client_data_models/models/order/order_model.dart';

part 'building-material_model.g.dart';

@JsonSerializable(createToJson: false)
class BuildingMaterialBase extends Purchasable {
  String name;
  String image;
  String description;

  BuildingMaterialBase({this.name, this.image, this.description});
  factory BuildingMaterialBase.fromJson(json) =>
      _$BuildingMaterialBaseFromJson(json);
}

@HiveType(typeId: 170)
@JsonSerializable(includeIfNull: false)
class BuildingMaterial extends BuildingMaterialBase {
  List<BuildingMaterialPricing> pricing;

  BuildingMaterial({String name, String image, String description})
      : super(
          name: name,
          image: image,
          description: description,
        );

  Map<String, dynamic> toJson() => _$BuildingMaterialToJson(this);
  factory BuildingMaterial.fromJson(json) {
    /// TODO: I am here.

    // final city = AppData.instance().city;
    final material = _$BuildingMaterialFromJson(json);

    if (material.pricing.isNotEmpty) {
      material.pricing = [
        // material.pricing.firstWhere((element) => element.city == city)
      ];
    }

    return material;
  }
}

@JsonSerializable(includeIfNull: false)
class BuildingMaterialPricing extends BaseModelHive {
  String city;
  double price12yards;
  double price20yards;

  BuildingMaterialPricing({this.city, this.price12yards, this.price20yards});

  Map<String, dynamic> toJson() => _$BuildingMaterialPricingToJson(this);
  factory BuildingMaterialPricing.fromJson(json) =>
      _$BuildingMaterialPricingFromJson(json);
}

@HiveType(typeId: 117)
enum BuildingMaterialSize {
  @HiveField(0)
  @JsonValue('12 Yards')
  yards12,
  @HiveField(1)
  @JsonValue('20 Yards')
  yards20
}
