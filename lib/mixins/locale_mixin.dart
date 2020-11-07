import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin LocaleData {
  static final locale = ValueNotifier<Locale>(null);
  static Future<void> initiate() async {
    locale.value = Locale.fromSubtags(
      languageCode:
          (await SharedPreferences.getInstance()).getString('locale') ?? 'en',
    );
  }

  void changeLocale(Locale locale) {
    LocaleData.locale.value = locale;
  }
}
