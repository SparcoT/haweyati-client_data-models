import 'package:shared_preferences/shared_preferences.dart';

mixin FuseData {
  Future<void> burnFuse() async =>
      (await SharedPreferences.getInstance()).setBool('fuseBurnt', true);

  Future<void> updateRewardPointSARValue(double value) async =>
      (await SharedPreferences.getInstance()).setDouble('rewardPointSarValue', value);

  Future<double> get rewardPointSarValue async =>
      (await SharedPreferences.getInstance()).getDouble('rewardPointSarValue') ?? 0.0;

  Future<bool> get isFuseBurnt async =>
      (await SharedPreferences.getInstance()).getBool('fuseBurnt') ?? false;
}
