// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product-rent_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductRentAdapter extends TypeAdapter<ProductRent> {
  @override
  final int typeId = 21;

  @override
  ProductRent read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductRent(
      city: fields[2] as String,
      rent: fields[3] as double,
      days: fields[1] as int,
      extraDayRent: fields[5] as double,
      helperPrice: fields[4] as double,
    )..id = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, ProductRent obj) {
    writer
      ..writeByte(6)
      ..writeByte(1)
      ..write(obj.days)
      ..writeByte(2)
      ..write(obj.city)
      ..writeByte(3)
      ..write(obj.rent)
      ..writeByte(4)
      ..write(obj.helperPrice)
      ..writeByte(5)
      ..write(obj.extraDayRent)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductRentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRent _$ProductRentFromJson(Map<String, dynamic> json) {
  return ProductRent(
    city: json['city'] as String,
    rent: (json['rent'] as num)?.toDouble(),
    days: json['days'] as int,
    extraDayRent: (json['extraDayRent'] as num)?.toDouble(),
    helperPrice: (json['helperPrice'] as num)?.toDouble(),
  )..id = json['_id'] as String;
}

Map<String, dynamic> _$ProductRentToJson(ProductRent instance) {
  final val = <String, dynamic>{
    '_id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('days', instance.days);
  writeNotNull('city', instance.city);
  writeNotNull('rent', instance.rent);
  writeNotNull('helperPrice', instance.helperPrice);
  writeNotNull('extraDayRent', instance.extraDayRent);
  return val;
}
