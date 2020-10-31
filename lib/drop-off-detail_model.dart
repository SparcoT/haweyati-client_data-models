import 'package:haweyati_client_data_models/common/json_serializable.dart';
import 'package:haweyati_client_data_models/models/time-slot_model.dart';

import 'location_model.dart';

class DropOff implements JsonSerializable {
  DateTime date;
  TimeSlot time;
  Location location;

  DropOff({
    this.date,
    this.time,
    this.location
  });

  factory DropOff.fromJson(Map<String, dynamic> json) {
    return DropOff(
      date: json['date'],
      time: TimeSlot.fromJson(json['time']),
      location: Location.fromJson(json['location'])
    );
  }

  @override
  Map<String, dynamic> serialize() => {
    ///TODO: Prettify the object

    'dropoffDate': date,
    'dropoffTime': time.serialize(),
    'dropoffAddress': location.address,
    'dropoffLocation': {
      'latitude': location.latitude,
      'longitude': location.longitude
    }
  };
}