import 'package:haweyati_client_data_models/models/others/location_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/model.dart';
import 'profile_model.dart';

part 'customer_model.g.dart';

@HiveType(typeId: 128)
@JsonSerializable(includeIfNull: false)
class Customer extends BaseModelHive {
  @HiveField(1) String status;
  @HiveField(2) String message;
  @HiveField(3) Profile profile;
  @HiveField(4) Location location;
  @HiveField(5) int points;
  @HiveField(6) String referralCode;

  String get name => profile.name;

  Customer();

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
  factory Customer.fromJson(json) => _$CustomerFromJson(json);
}
