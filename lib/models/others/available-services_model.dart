import 'package:json_annotation/json_annotation.dart';

part 'available-services_model.g.dart';

@JsonSerializable(createToJson: false)
class AvailableServices {
  List<String> services;

  AvailableServices({this.services});
  factory AvailableServices.fromJson(json) => _$AvailableServicesFromJson(json);
}