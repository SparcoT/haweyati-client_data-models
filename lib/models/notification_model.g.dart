// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationRequest _$NotificationRequestFromJson(Map<String, dynamic> json) {
  return NotificationRequest(
    title: json['title'] as String,
    body: json['body'] as String,
  );
}

Map<String, dynamic> _$NotificationRequestToJson(
        NotificationRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'body': instance.body,
    };
