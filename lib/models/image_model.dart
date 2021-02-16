import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@HiveType(typeId: 102)
@JsonSerializable()
class ImageModel {
  @HiveField(0)
  String name;
  ImageModel({this.name});

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
  factory ImageModel.fromJson(json) => _$ImageModelFromJson(json);
}