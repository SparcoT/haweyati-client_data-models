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

  Future<void> signIn(Customer customer, String accessToken) async {
    _user = customer;
    _accessToken = accessToken;

    await (await SharedPreferences.getInstance())
        .setString('access_token', accessToken);

    await Hive.lazyBox<Customer>('customers').add(customer);
    await customer.save();
  }

  Future<void> signOut() async {
    _user = null;
    _accessToken = null;
    await Hive.lazyBox<Customer>('customers').clear();
  }

  String get accessToken => _accessToken;
  bool get isAuthenticated => _user != null;
}
