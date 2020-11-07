import 'package:shared_preferences/shared_preferences.dart';

mixin FuseData {
  Future<void> burnFuse() async =>
      (await SharedPreferences.getInstance()).setBool('fuseBurnt', true);

  Future<bool> get isFuseBurnt async =>
      (await SharedPreferences.getInstance()).getBool('fuseBurnt');
}
