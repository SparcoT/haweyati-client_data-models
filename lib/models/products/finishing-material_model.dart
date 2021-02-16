import 'package:haweyati_client_data_models/models/image_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/model.dart';
import 'package:haweyati_client_data_models/models/order/order_model.dart';
part 'finishing-material_model.g.dart';

@JsonSerializable(createToJson: false)
class FinishingMaterialBase extends Purchasable {
  @HiveField(1)
  String name;
  @HiveField(2)
  ImageModel image;
  @HiveField(3)
  String description;
  @HiveField(8)
  double volumetricWeight;
  @HiveField(9)
  double cbmLength;
  @HiveField(10)
  double cbmWidth;
  @HiveField(11)
  double cbmHeight;
  FinishingMaterialBase({this.name, this.image,
    this.cbmHeight,this.cbmLength,this.cbmWidth,
    this.description,this.volumetricWeight});
  factory FinishingMaterialBase.fromJson(json) =>
      _$FinishingMaterialBaseFromJson(json);
}

@HiveType(typeId: 170)
@JsonSerializable(includeIfNull: false)
class FinishingMaterial extends FinishingMaterialBase {
  @HiveField(4)
  double price;
  @HiveField(5)
  String parent;

  @HiveField(6)
  @JsonKey(name: 'varient')
  List<Map<String, dynamic>> variants;

  @HiveField(7)
  List<FinishingMaterialOption> options;

  FinishingMaterial({
    String name,
    ImageModel image,
    String description,
    double volumetricWeight,
    this.variants,
    this.options,
  }) : super(
          name: name,
          image: image,
          description: description,
    volumetricWeight: volumetricWeight
        );

  Map<String, dynamic> toJson() => _$FinishingMaterialToJson(this);
  factory FinishingMaterial.fromJson(json) => _$FinishingMaterialFromJson(json);


  Tuple<double, Map<String, dynamic>> variant(Map<String, dynamic> variant) {
    for (final _variant in variants) {
      var flag = true;

      for (final key in _variant.keys) {
        if (key == 'price' || key =='cbmWidth' || key == 'volumetricWeight' ||
            key == 'cbmLength' || key == 'cbmHeight') continue;
        if (variant[key] != _variant[key]) {
          flag = false;
          break;
        }
      }

      if (flag) {
        return Tuple(double.tryParse(_variant['price'])
            ?? int.tryParse(_variant['price']).toDouble() ?? 0.0, _variant);
      }
    }

    return Tuple(0.0, null);
  }

  @deprecated
  double variantPrice(Map<String, dynamic> variant) {
    for (final _variant in variants) {
      var flag = true;

      for (final key in _variant.keys) {
        if (key == 'price' || key =='cbmWidth' || key == 'volumetricWeight' ||
            key == 'cbmLength' || key == 'cbmHeight') continue;
        if (variant[key] != _variant[key]) {
          flag = false;
          break;
        }
      }

      if (flag) {
        return double.tryParse(_variant['price'])
            ?? int.tryParse(_variant['price']).toDouble() ?? 0.0;
      }
    }

    return 0.0;
  }
}

@HiveType(typeId: 131)
@JsonSerializable(includeIfNull: false)
class FinishingMaterialOption extends BaseModelHive {
  @HiveField(1)
  @JsonKey(name: 'optionName')
  String name;

  @HiveField(2)
  @JsonKey(name: 'optionValues', fromJson: _fun)
  List<String> values;

  FinishingMaterialOption({this.name, List<String> values}) : values = values;

  Map<String, dynamic> toJson() => _$FinishingMaterialOptionToJson(this);
  factory FinishingMaterialOption.fromJson(json) =>
      _$FinishingMaterialOptionFromJson(json);
}

class Tuple<T, U> {
  final T first;
  U second;
  Tuple(this.first, this.second);
}

List<String> _fun(value) {
  if (value is String) {
    return value?.split(',')?.map((e) => e.trim())?.toList();
  } else if (value is List) {
    return value?.cast<String>();
  }

  return null;
}
