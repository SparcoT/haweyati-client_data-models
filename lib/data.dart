import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:haweyati_client_data_models/mixins/auth_mixin.dart';
import 'package:haweyati_client_data_models/mixins/cart_mixin.dart';
import 'package:haweyati_client_data_models/mixins/fuse_mixin.dart';
import 'package:haweyati_client_data_models/mixins/locale_mixin.dart';
import 'package:haweyati_client_data_models/mixins/location_mixin.dart';

/// Export All Models;
export 'models/products/building-material_model.dart';
export 'models/products/dumpster_model.dart';
export 'models/products/finishing-material_model.dart';

export 'models/auth/sign-in_model.dart';
export 'models/others/location_model.dart';
export 'models/others/available-services_model.dart';
export 'models/user/customer_model.dart';
export 'models/user/profile_model.dart';

export 'models/time-slot_model.dart';
export 'models/order/order_model.dart';
export 'models/order/products/building-material_orderable.dart';
export 'models/order/products/dumpster_orderable.dart';
export 'models/order/products/finishing-material_orderable.dart';

class AppData with AuthData, FuseData, LocationData, CartDate, LocaleData {
  AppData._();

  static bool _isInitiated;
  static Future initiate() async {
    await Hive.initFlutter();

    await AuthData.initiate();
    await CartDate.initiate();
    await LocaleData.initiate();
    await LocationData.initiate();

    _isInitiated = true;
  }

  factory AppData() {
    if (_isInitiated) {
      return AppData._();
    } else {
      throw 'AppData has not been initialized';
    }
  }
}
