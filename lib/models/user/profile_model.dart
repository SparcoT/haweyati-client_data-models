import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/model.dart';

part 'profile_model.g.dart';

@HiveType(typeId: 129)
@JsonSerializable(includeIfNull: false)
class $Profile extends BaseModelHive {
  @HiveField(1)
  String name;

  @HiveField(2)
  String email;

  @HiveField(3)
  String contact;

  @HiveField(4)
  String username;

  @HiveField(5)
  String password;

  @HiveField(6)
  bool isGuest;

  @HiveField(7)
  bool isVerified;

  @HiveField(8)
  String image;

  @HiveField(9)
  List<String> scope;

  @HiveField(10)
  @JsonKey(name: 'token')
  String deviceToken;

  $Profile({
    this.name,
    this.email,
    this.contact,
    this.username,
    this.password,
    this.scope,
    this.isGuest,
    this.isVerified,
    this.deviceToken,
  });

  Map<String, dynamic> toJson() => _$$ProfileToJson(this);
  factory $Profile.fromJson(json) => _$$ProfileFromJson(json);
}

/// POST customer/guest-sign-up/
