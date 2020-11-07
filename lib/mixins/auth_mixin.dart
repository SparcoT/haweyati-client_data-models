import 'package:haweyati_client_data_models/models/user/customer_model.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin AuthData {
  static Customer _user;
  static String _accessToken;

  static Future<void> initiate() async {
    Hive.registerAdapter(CustomerAdapter());
    _user = await (await Hive.openLazyBox<Customer>('customers')).getAt(0);
    _accessToken =
        (await SharedPreferences.getInstance()).getString('access_token');
  }

  Future<void> signOut() async {
    _user = null;
    _accessToken = null;
    await Hive.lazyBox<Customer>('customers').clear();
  }

  Customer get user => _user;
  set user(Customer customer) {
    _user = customer;

    Hive.lazyBox<Customer>('customers')
        .add(customer)
        .then((value) => customer.save());
  }

  String get accessToken => _accessToken;
  set accessToken(String token) => _accessToken = token;

  bool get isAuthenticated => _user != null;
}
