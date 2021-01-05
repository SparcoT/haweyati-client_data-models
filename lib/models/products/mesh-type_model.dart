import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/data.dart';
import 'package:haweyati_client_data_models/models/order/order_model.dart';

part 'mesh-type_model.g.dart';

@JsonSerializable(includeIfNull: false)
class Mesh extends Purchasable {
  @HiveField(1)
  double half;
  @HiveField(2)
  double full;
  Mesh({this.half,this.full});

  Map<String, dynamic> toJson() => _$MeshToJson(this);
  factory Mesh.fromJson(json) => _$MeshFromJson(json);

}
