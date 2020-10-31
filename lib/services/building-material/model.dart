import 'package:haweyati_client_data_models/models/order/order-item_model.dart';
import 'package:hive/hive.dart';

import '../../image_model.dart';
import 'pricing_model.dart';

part 'model.g.dart';

@HiveType(typeId: 21)
class BuildingMaterial extends HiveObject implements Orderable {
  @HiveField(0) String id;
  @HiveField(1) String name;
  @HiveField(2) String parent;
  @HiveField(3) ImageModel image;
  @HiveField(4) String description;
  @HiveField(5) List<BuildingMaterialPricing> pricing;

  BuildingMaterial({
    this.id,
    this.name,
    this.image,
    this.parent,
    this.pricing,
    this.description,
  });

  BuildingMaterial.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    parent = json['parent'];

    if (json['pricing'] != null) {
      pricing = <BuildingMaterialPricing>[];

      json['pricing'].forEach((v) {
        pricing.add(BuildingMaterialPricing.fromJson(v));
      });
    }

    description = json['description'];
    image = ImageModel.fromJson(json['image']);
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'image': image.serialize(),
    'parent': parent,

    'pricing': pricing
      ?.map((e) => e.toJson())
      ?.toList(),

    'description': description,
  };

  @override
  Map<String, dynamic> serialize() => toJson();
}



