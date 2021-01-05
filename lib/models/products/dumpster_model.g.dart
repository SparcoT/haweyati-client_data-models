// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dumpster_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dumpster _$DumpsterFromJson(Map<String, dynamic> json) {
  return Dumpster(
    size: json['size'] as String,
    image: json['image'] == null ? null : ImageModel.fromJson(json['image']),
    description: json['description'] as String,
    pricing: (json['pricing'] as List)
        ?.map((e) => e == null ? null : ProductRent.fromJson(e))
        ?.toList(),
  )..id = json['_id'] as String;
}

Map<String, dynamic> _$DumpsterToJson(Dumpster instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('size', instance.size);
  writeNotNull('image', instance.image);
  writeNotNull('description', instance.description);
  writeNotNull('pricing', instance.pricing);
  return val;
}
