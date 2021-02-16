import 'package:haweyati_client_data_models/models/others/location_model.dart';
import 'package:hive/hive.dart';
import '../../model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'profile_model.dart';
part 'supplier_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable(includeIfNull: false)
class Supplier extends BaseModelHive {
  @HiveField(1) String city;
  @HiveField(2) String status;
  @HiveField(3) Location location;
  @HiveField(4) Profile person;
  @HiveField(5) String shopParentId;
  @HiveField(6) List<String> services;
  @HiveField(7) String message;

  Supplier({
    this.services,
    this.person,
    this.city,
    this.location,
    this.shopParentId,
    this.message,
    this.status,
  });

  Map<String, dynamic> toJson() => _$SupplierToJson(this);
  factory Supplier.fromJson(json) => _$SupplierFromJson(json);

}
