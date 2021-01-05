// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileAdapter extends TypeAdapter<Profile> {
  @override
  final int typeId = 129;

  @override
  Profile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Profile(
      name: fields[1] as String,
      email: fields[2] as String,
      contact: fields[3] as String,
      username: fields[4] as String,
      password: fields[5] as String,
      scope: (fields[9] as List)?.cast<String>(),
      isGuest: fields[6] as bool,
      isVerified: fields[7] as bool,
      deviceToken: fields[10] as String,
    )
      ..image = fields[8] as ImageModel
      ..id = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, Profile obj) {
    writer
      ..writeByte(11)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.contact)
      ..writeByte(4)
      ..write(obj.username)
      ..writeByte(5)
      ..write(obj.password)
      ..writeByte(6)
      ..write(obj.isGuest)
      ..writeByte(7)
      ..write(obj.isVerified)
      ..writeByte(8)
      ..write(obj.image)
      ..writeByte(9)
      ..write(obj.scope)
      ..writeByte(10)
      ..write(obj.deviceToken)
      ..writeByte(0)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    name: json['name'] as String,
    email: json['email'] as String,
    contact: json['contact'] as String,
    username: json['username'] as String,
    password: json['password'] as String,
    scope: (json['scope'] as List)?.map((e) => e as String)?.toList(),
    isGuest: json['guest'] as bool,
    isVerified: json['isVerified'] as bool,
    deviceToken: json['token'] as String,
  )
    ..id = json['_id'] as String
    ..image = json['image'] == null ? null : ImageModel.fromJson(json['image']);
}

Map<String, dynamic> _$ProfileToJson(Profile instance) {
  final val = <String, dynamic>{
    '_id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('contact', instance.contact);
  writeNotNull('username', instance.username);
  writeNotNull('password', instance.password);
  writeNotNull('guest', instance.isGuest);
  writeNotNull('isVerified', instance.isVerified);
  writeNotNull('image', instance.image);
  writeNotNull('scope', instance.scope);
  writeNotNull('token', instance.deviceToken);
  return val;
}
