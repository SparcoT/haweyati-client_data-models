// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'building-material_orderable.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BuildingMaterialOrderableAdapter
    extends TypeAdapter<BuildingMaterialOrderable> {
  @override
  final int typeId = 52;

  @override
  BuildingMaterialOrderable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BuildingMaterialOrderable(
      product: fields[0] as BuildingMaterial,
      qty: fields[1] as int,
      price: fields[2] as BMPrice,
    );
  }

  @override
  void write(BinaryWriter writer, BuildingMaterialOrderable obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.qty)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(0)
      ..write(obj.product);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BuildingMaterialOrderableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuildingMaterialOrderable _$BuildingMaterialOrderableFromJson(
    Map<String, dynamic> json) {
  return BuildingMaterialOrderable(
    product: json['product'] == null
        ? null
        : BuildingMaterial.fromJson(json['product']),
    qty: json['qty'] as int,
    price: json['price'] == null ? null : BMPrice.fromJson(json['price']),
  );
}

Map<String, dynamic> _$BuildingMaterialOrderableToJson(
    BuildingMaterialOrderable instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('product', instance.product);
  writeNotNull('qty', instance.qty);
  writeNotNull('price', instance.price);
  return val;
}
