import 'package:json_annotation/json_annotation.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationRequest {
  String title;
  String body;

  NotificationRequest({this.title, this.body});

  Map<String, dynamic> toJson() => _$NotificationRequestToJson(this);

  factory NotificationRequest.fromJson(json) => _$NotificationRequestFromJson(json);
}
