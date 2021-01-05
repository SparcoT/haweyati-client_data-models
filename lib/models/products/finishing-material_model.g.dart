// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finishing-material_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FinishingMaterialAdapter extends TypeAdapter<FinishingMaterial> {
  @override
  final int typeId = 170;

  @override
  FinishingMaterial read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FinishingMaterial(
      name: fields[1] as String,
      image: fields[2] as ImageModel,
      description: fields[3] as String,
      variants: (fields[6] as List)
          ?.map((dynamic e) => (e as Map)?.cast<String, dynamic>())
          ?.toList(),
      options: (fields[7] as List)?.cast<FinishingMaterialOption>(),
    )
      ..price = fields[4] as double
      ..parent = fields[5] as String
      ..id = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, FinishingMaterial obj) {
    writer
      ..writeByte(8)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.parent)
      ..writeByte(6)
      ..write(obj.variants)
      ..writeByte(7)
      ..write(obj.options)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinishingMaterialAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FinishingMaterialOptionAdapter
    extends TypeAdapter<FinishingMaterialOption> {
  @override
  final int typeId = 131;

  @override
  FinishingMaterialOption read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FinishingMaterialOption(
      name: fields[1] as String,
      values: (fields[2] as List)?.cast<String>(),
    )..id = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, FinishingMaterialOption obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.values)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinishingMaterialOptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishingMaterialBase _$FinishingMaterialBaseFromJson(
    Map<String, dynamic> json) {
  return FinishingMaterialBase(
    name: json['name'] as String,
    image: json['image'] == null ? null : ImageModel.fromJson(json['image']),
    description: json['description'] as String,
  )..id = json['_id'] as String;
}

FinishingMaterial _$FinishingMaterialFromJson(Map<String, dynamic> json) {
  return FinishingMaterial(
    name: json['name'] as String,
    image: json['image'] == null ? null : ImageModel.fromJson(json['image']),
    description: json['description'] as String,
    variants: (json['varient'] as List)
        ?.map((e) => e as Map<String, dynamic>)
        ?.toList(),
    options: (json['options'] as List)
        ?.map((e) => e == null ? null : FinishingMaterialOption.fromJson(e))
        ?.toList(),
  )
    ..id = json['_id'] as String
    ..price = (json['price'] as num)?.toDouble()
    ..parent = json['parent'] as String;
}

Map<String, dynamic> _$FinishingMaterialToJson(FinishingMaterial instance) {
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
  writeNotNull('price', instance.price);
  writeNotNull('parent', instance.parent);
  writeNotNull('varient', instance.variants);
  writeNotNull('options', instance.options);
  return val;
}

FinishingMaterialOption _$FinishingMaterialOptionFromJson(
    Map<String, dynamic> json) {
  return FinishingMaterialOption(
    name: json['optionName'] as String,
    values: _fun(json['optionValues']),
  )..id = json['_id'] as String;
}

Map<String, dynamic> _$FinishingMaterialOptionToJson(
    FinishingMaterialOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('optionName', instance.name);
  writeNotNull('optionValues', instance.values);
  return val;
}
