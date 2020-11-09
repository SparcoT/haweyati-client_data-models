import 'package:haweyati_client_data_models/data.dart';
import 'package:haweyati_client_data_models/models/image_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/model.dart';
import 'package:haweyati_client_data_models/models/order/order_model.dart';

part 'building-material_model.g.dart';

@JsonSerializable(createToJson: false)
class BuildingMaterialBase extends Purchasable {
  String name;
  ImageModel image;
  String description;

  BuildingMaterialBase({this.name, this.image, this.description});
  factory BuildingMaterialBase.fromJson(json) =>
      _$BuildingMaterialBaseFromJson(json);
}

@HiveType(typeId: 170)
@JsonSerializable(includeIfNull: false)
class BuildingMaterial extends BuildingMaterialBase {
  List<BuildingMaterialPricing> pricing;

  BuildingMaterial({String name, ImageModel image, String description})
      : super(
          name: name,
          image: image,
          description: description,
        );

  double get price12 => pricing.first.price12yard;
  double get price20 => pricing.first.price20yard;

  Map<String, dynamic> toJson() => _$BuildingMaterialToJson(this);
  factory BuildingMaterial.fromJson(json) {
    final city = AppData().city;
    final material = _$BuildingMaterialFromJson(json);

    if (material.pricing.isNotEmpty) {
      material.pricing = [
        material.pricing.firstWhere((element) => element.city == city)
      ];
    }

    return material;
  }


  BuildingMaterial.from(BuildingMaterial material) {
    name = material.name;
    image = material.image;
    description = material.description;

    pricing = List.from(material.pricing);
  }
}

@JsonSerializable(includeIfNull: false)
class BuildingMaterialPricing extends BaseModelHive {
  String city;
  double price12yard;
  double price20yard;

  BuildingMaterialPricing({this.city, this.price12yard, this.price20yard});

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

extension ExBuildingMaterialSize on BuildingMaterialSize {
  String exToString() {
    if (this == BuildingMaterialSize.yards12) {
      return '12 Yards';
    } else if (this == BuildingMaterialSize.yards20) {
      return '20 Yards';
    }

    return null;
  }
}
