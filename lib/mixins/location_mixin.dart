import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:haweyati_client_data_models/models/others/location_model.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin LocationData {
  static String _city;
  static String _address;
  static LatLng _coordinates;

  static Future<void> initiate() async {
    Hive.registerAdapter(LocationAdapter());
    final preferences = await SharedPreferences.getInstance();

    _city = preferences.get('city');
    _address = preferences.get('address');

    try {
      _coordinates = LatLng(
        preferences.getDouble('latitude'),
        preferences.getDouble('longitude'),
      );
    } catch (e) {
      _coordinates = null;
    }
  }

  set location(Location details) {
    _city = details.city;
    _address = details.address;
    _coordinates = LatLng(details.latitude, details.longitude);

    SharedPreferences.getInstance().then((value) {
      value.setString('city', _city);
      value.setString('address', _address);

      value.setDouble('latitude', _coordinates.latitude);
      value.setDouble('longitude', _coordinates.longitude);
    });
  }

  Location get location {
    if (_coordinates != null) {
      return Location(
        city: city,
        address: address,
        latitude: _coordinates.latitude,
        longitude: _coordinates.longitude,
      );
    } else {
      return null;
    }
  }

  String get city => _city;
  String get address => _address;
  LatLng get coordinates => _coordinates;
}
