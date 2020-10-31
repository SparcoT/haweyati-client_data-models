import 'package:haweyati_client_data_models/common/json_serializable.dart';

class Payment extends JsonSerializable {
  String type;
  String intentId;

  Payment({
    this.type,
    this.intentId
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      type: json['type'] ?? json['paymentType'],
      intentId: json['intentId'] ?? json['paymentIntentId']
    );
  }

  @override
  Map<String, dynamic> serialize() => {
    'type': type, 'intentId': intentId
  };
}