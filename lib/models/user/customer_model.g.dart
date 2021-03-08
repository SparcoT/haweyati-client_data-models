// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CustomerAdapter extends TypeAdapter<Customer> {
  @override
  final int typeId = 128;

  @override
  Customer read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Customer()
      ..status = fields[1] as String
      ..message = fields[2] as String
      ..profile = fields[3] as Profile
      ..location = fields[4] as Location
      ..points = fields[5] as int
      ..referralCode = fields[6] as String
      ..id = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, Customer obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.message)
      ..writeByte(3)
      ..write(obj.profile)
      ..writeByte(4)
      ..write(obj.location)
      ..writeByte(5)
      ..write(obj.points)
      ..writeByte(6)
      ..write(obj.referralCode)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer()
    ..id = json['_id'] as String
    ..status = json['status'] as String
    ..message = json['message'] as String
    ..profile =
        json['profile'] == null ? null : Profile.fromJson(json['profile'])
    ..location =
        json['location'] == null ? null : Location.fromJson(json['location'])
    ..points = json['points'] as int
    ..referralCode = json['referralCode'] as String;
}

Map<String, dynamic> _$CustomerToJson(Customer instance) {
  final val = <String, dynamic>{
    '_id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('message', instance.message);
  writeNotNull('profile', instance.profile);
  writeNotNull('location', instance.location);
  writeNotNull('points', instance.points);
  writeNotNull('referralCode', instance.referralCode);
  return val;
}
