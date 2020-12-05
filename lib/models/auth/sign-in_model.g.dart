// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign-in_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequest _$SignInRequestFromJson(Map<String, dynamic> json) {
  return SignInRequest(
    username: json['username'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$SignInRequestToJson(SignInRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) {
  return SignInResponse(
    json['access_token'] as String,
  );
}

Map<String, dynamic> _$SignInResponseToJson(SignInResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
    };
