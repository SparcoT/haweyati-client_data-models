// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dumpster_orderable.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DumpsterOrderableAdapter extends TypeAdapter<DumpsterOrderable> {
  @override
  final int typeId = 51;

  @override
  DumpsterOrderable read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DumpsterOrderable(
      product: fields[0] as Dumpster,
      qty: fields[3] as int,
      extraDays: fields[1] as int,
      extraDaysPrice: fields[2] as double,
    );
  }

  @override
  void write(BinaryWriter writer, DumpsterOrderable obj) {
    writer
      ..writeByte(4)
      ..writeByte(3)
      ..write(obj.qty)
      ..writeByte(1)
      ..write(obj.extraDays)
      ..writeByte(2)
      ..write(obj.extraDaysPrice)
      ..writeByte(0)
      ..write(obj.product);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DumpsterOrderableAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DumpsterOrderable _$DumpsterOrderableFromJson(Map<String, dynamic> json) {
  return DumpsterOrderable(
    product:
        json['product'] == null ? null : Dumpster.fromJson(json['product']),
    qty: json['qty'] as int,
    extraDays: json['extraDays'] as int,
    extraDaysPrice: (json['extraDaysPrice'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$DumpsterOrderableToJson(DumpsterOrderable instance) =>
    <String, dynamic>{
      'product': instance.product,
      'qty': instance.qty,
      'extraDays': instance.extraDays,
      'extraDaysPrice': instance.extraDaysPrice,
    };
