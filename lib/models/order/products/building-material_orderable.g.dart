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
      fields[2] as BuildingMaterialSize,
      product: fields[0] as BuildingMaterial,
      qty: fields[1] as int,
      price: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, BuildingMaterialOrderable obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.qty)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.size)
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
    _$enumDecodeNullable(_$BuildingMaterialSizeEnumMap, json['size']),
    product: json['product'] == null
        ? null
        : BuildingMaterial.fromJson(json['product']),
    qty: json['qty'] as int,
    price: (json['price'] as num)?.toDouble(),
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
  writeNotNull('size', _$BuildingMaterialSizeEnumMap[instance.size]);
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$BuildingMaterialSizeEnumMap = {
  BuildingMaterialSize.yards12: '12 Yards',
  BuildingMaterialSize.yards20: '20 Yards',
};
