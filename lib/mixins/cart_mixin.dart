import 'package:haweyati_client_data_models/models/products/finishing-material_model.dart';
import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';

mixin CartDate {
  static Future<void> initiate() async {
    Hive.registerAdapter(FinishingMaterialAdapter());
    Hive.registerAdapter(FinishingMaterialOptionAdapter());

    await Hive.openLazyBox<FinishingMaterial>('cart');
  }

  ValueNotifier<int> get cartSize =>
      ValueNotifier(Hive.lazyBox<FinishingMaterial>('cart').length);

  Stream<List<FinishingMaterial>> getCartProducts() async* {
    final list = [];
    final box = Hive.lazyBox<FinishingMaterial>('cart');

    for (final key in box.keys) {
      list.add(await box.get(key));

      yield list;
    }
  }

  Future<void> addToCart(FinishingMaterial holder) async {
    await Hive.lazyBox<FinishingMaterial>('cart').put(holder.id, holder);
    await holder.save();

    ++cartSize.value;
  }

  Future<void> removeFromCart(FinishingMaterial holder) async {
    await Hive.lazyBox<FinishingMaterial>('cart').delete(holder.id);

    --cartSize.value;
  }

  Future<bool> canAddToCart(FinishingMaterial holder) async =>
      !(Hive.lazyBox<FinishingMaterial>('cart').containsKey(holder.id));
}