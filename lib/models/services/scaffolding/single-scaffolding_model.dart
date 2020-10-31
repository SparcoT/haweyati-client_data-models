import 'package:haweyati_client_data_models/models/order/order-item_model.dart';
import 'scaffolding-item_model.dart';

enum SingleScaffoldingType {
  halfSteel, fullSteel
}

class SingleScaffolding extends Orderable {
  ScaffoldingItem item;
  SingleScaffoldingType type;

  @override
  Map<String, dynamic> serialize() => {
    'item': item.serialize(), 'isFullSteel': resolveType(type)
  };

  SingleScaffolding({
    ScaffoldingItem item,
    SingleScaffoldingType type
  }) {
    this.item ??= ScaffoldingItem();
  }

  factory SingleScaffolding.fromJson(Map<String, dynamic> json) {
    return SingleScaffolding(
      type: parseType(json['isFullSteel']),
      item: ScaffoldingItem.fromJson(json['item'])
    );
  }

  static SingleScaffoldingType parseType(bool value) {
    return value
      ? SingleScaffoldingType.fullSteel
      : SingleScaffoldingType.halfSteel;
  }

  static bool resolveType(SingleScaffoldingType type) {
    return type == SingleScaffoldingType.fullSteel;
  }
}