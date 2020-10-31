import 'package:haweyati_client_data_models/common/json_serializable.dart';
import 'package:hive/hive.dart';

class ScaffoldingItem extends HiveObject implements JsonSerializable {
  int qty; double size;

  ScaffoldingItem({this.qty = 0, this.size});
  factory ScaffoldingItem.fromJson(Map<String, dynamic> json) {
    return ScaffoldingItem(qty: json['qty'], size: json['size']);
  }

  @override
  Map<String, dynamic> serialize() => {
    'qty': qty, 'size': size
  };
}