// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building-material_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BuildingMaterialSizeAdapter extends TypeAdapter<BuildingMaterialSize> {
  @override
  final int typeId = 117;

  @override
  BuildingMaterialSize read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BuildingMaterialSize.yards12;
      case 1:
        return BuildingMaterialSize.yards20;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, BuildingMaterialSize obj) {
    switch (obj) {
      case BuildingMaterialSize.yards12:
        writer.writeByte(0);
        break;
      case BuildingMaterialSize.yards20:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BuildingMaterialSizeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BuildingMaterialAdapter extends TypeAdapter<BuildingMaterial> {
  @override
  final int typeId = 170;

  @override
  BuildingMaterial read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BuildingMaterial()..id = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, BuildingMaterial obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BuildingMaterialAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildingMaterialBase _$BuildingMaterialBaseFromJson(Map<String, dynamic> json) {
  return BuildingMaterialBase(
    name: json['name'] as String,
    image: json['image'] == null ? null : ImageModel.fromJson(json['image']),
    description: json['description'] as String,
    volumetricWeight: (json['volumetricWeight'] as num)?.toDouble(),
    cbmHeight: (json['cbmHeight'] as num)?.toDouble(),
    cbmLength: (json['cbmLength'] as num)?.toDouble(),
    cbmWidth: (json['cbmWidth'] as num)?.toDouble(),
  )..id = json['_id'] as String;
}

BuildingMaterial _$BuildingMaterialFromJson(Map<String, dynamic> json) {
  return BuildingMaterial(
    name: json['name'] as String,
    image: json['image'] == null ? null : ImageModel.fromJson(json['image']),
    description: json['description'] as String,
    volumetricWeight: (json['volumetricWeight'] as num)?.toDouble(),
  )
    ..id = json['_id'] as String
    ..cbmHeight = (json['cbmHeight'] as num)?.toDouble()
    ..cbmLength = (json['cbmLength'] as num)?.toDouble()
    ..cbmWidth = (json['cbmWidth'] as num)?.toDouble()
    ..pricing = (json['pricing'] as List)
        ?.map((e) => e == null ? null : BuildingMaterialPricing.fromJson(e))
        ?.toList();
}

Map<String, dynamic> _$BuildingMaterialToJson(BuildingMaterial instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  val['name'] = instance.name;
  val['image'] = instance.image;
  val['description'] = instance.description;
  val['volumetricWeight'] = instance.volumetricWeight;
  val['cbmHeight'] = instance.cbmHeight;
  val['cbmLength'] = instance.cbmLength;
  val['cbmWidth'] = instance.cbmWidth;
  writeNotNull('pricing', instance.pricing);
  return val;
}

BuildingMaterialPricing _$BuildingMaterialPricingFromJson(
    Map<String, dynamic> json) {
  return BuildingMaterialPricing(
    city: json['city'] as String,
    price: (json['price'] as List)
        ?.map((e) => e == null ? null : BMPrice.fromJson(e))
        ?.toList(),
  )..id = json['_id'] as String;
}

Map<String, dynamic> _$BuildingMaterialPricingToJson(
    BuildingMaterialPricing instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('city', instance.city);
  writeNotNull('price', instance.price);
  return val;
}
