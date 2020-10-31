import 'serializable.dart';

abstract class JsonSerializable extends Serializable<Map<String, dynamic>> {
  @override Map<String, dynamic> serialize();
}
