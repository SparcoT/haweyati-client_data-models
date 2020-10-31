import 'package:haweyati_client_data_models/common/json_serializable.dart';
import 'package:haweyati_client_data_models/models/order/scaffoldings/order-item_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import '../payment_model.dart';
import '../user_model.dart';
import 'building-material/order-item_model.dart';
import 'dumpster/order-item_model.dart';
import 'finishing-material/order-item_model.dart';
import 'order-item_model.dart';
import 'order-location_model.dart';

class OrderImage implements JsonSerializable {
  String sort;
  String name;

  OrderImage({
    this.sort,
    this.name
  });

  @override
  Map<String, dynamic> serialize() => {
    'sort': sort, 'name': name
  };
}

@HiveType(typeId: 0)
class Order extends HiveObject implements JsonSerializable {
  String id;

  String city;
  String note;
  double total;
  String number;
  OrderType type;
  double deliveryFee;
  OrderStatus status;

  User customer;

  Payment payment;
  OrderLocation location;
  List<OrderImage> images;
  List<OrderItemHolder> items;

  DateTime createdAt;
  DateTime updatedAt;

  void addItem({OrderItem item, double price}) {
    items.add(OrderItemHolder(
      item: item, subtotal: price
    ));

    total += price;
  }

  Order(this.type, {
    this.id,
    this.city,
    this.note,
    this.total = 0.0,
    this.items,
    this.number,
    this.images = const [],
    this.status,
    this.payment,
    this.location,
    this.customer,
    this.createdAt,
    this.updatedAt,
    this.deliveryFee = 50
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    OrderItem Function(Map<String, dynamic>) _parser;
    final type = _typeFromString(json['service']);

    switch (type) {
      case OrderType.dumpster:
        _parser = DumpsterOrderItem.fromJson;
        break;
      case OrderType.scaffolding:
        _parser = ScaffoldingOrderItem.fromJson;
        break;
      case OrderType.buildingMaterial:
        _parser = BuildingMaterialOrderItem.fromJson;
        break;
      case OrderType.finishingMaterial:
        _parser = FinishingMaterialOrderItem.fromJson;
        break;
    }

    var status;
    switch (json['status']) {
      case 0:
        status = OrderStatus.pending;
        break;
      case 1:
        status = OrderStatus.active;
        break;
      case 2:
        status = OrderStatus.closed;
        break;
      case 3:
        status = OrderStatus.rejected;
        break;
      case 4:
        status = OrderStatus.dispatched;
        break;
    }

    return Order(_typeFromString(json['service']),
      id: json['_id'],
      status: status,
      note: json['note'],
      city: json['city'],
      number: json['orderNo'],
      total: json['total']?.toDouble(),
      deliveryFee: json['deliveryFee']?.toDouble() ?? 0.0,
      createdAt: DateTime.parse(json['createdAt']),
      payment: Payment.fromJson(/*json['payment'] ?? */json),

      customer: json['customer'] is String ? null : User.fromJson(json['customer']),

      location: OrderLocation.fromJson(json['dropoff']),

      items: (json['items'] as List)
        .map((item) {
          var supplier = item['supplier'];
          if (supplier is Map) {
            supplier = supplier['_id'];
          }

          return OrderItemHolder(
            supplier: supplier,
            subtotal: item['subtotal']?.toDouble(),

            item: _parser != null ? _parser(item['item']) : null
          );
        })
        .toList(growable: false),
    );
  }

  Map<String, dynamic> toJson() => {
    'city': city,
    'note': note,
    'total': total,
    'status': status,
    'orderNo': number,
    'deliveryFee': deliveryFee,
    'service': _typeToString(type),

    'items': items
        .map((e) => e.serialize())
        .toList(growable: false),

    'location': location.serialize(),

    'customer': customer.serialize(),
    'paymentType': payment?.type,
    'paymentIntentId': payment?.intentId,
  };

  @override Map<String, dynamic> serialize() => toJson();

  static String _typeToString(OrderType type) {
    switch (type) {
      case OrderType.dumpster: return 'Construction Dumpster';
      case OrderType.scaffolding: return 'Scaffolding';
      case OrderType.buildingMaterial: return 'Building Material';
      case OrderType.finishingMaterial: return 'Finishing Material';
    }

    throw 'Unknown type found $type';
  }
  static OrderType _typeFromString(String type) {
    switch (type) {
      case 'Scaffolding': return OrderType.scaffolding;
      case 'Building Material': return OrderType.buildingMaterial;
      case 'Finishing Material': return OrderType.finishingMaterial;
      case 'Construction Dumpster': return OrderType.dumpster;
    }

    throw 'Unknown type found $type';
  }
}

enum OrderStatus {
  rejected,
  pending,
  active,
  dispatched,
  closed,
}
enum OrderType {
  dumpster,
  scaffolding,
  buildingMaterial,
  finishingMaterial
}


// enum UserType { admin, driver, customer, supplier }
// class OrderUpdater {
//   String id;
//   UserType type;
// }
//
// class OrderUpdate {
//   String updatedBy;
//   OrderStatus status;
//
//   String note;
//   String message;
//   DateTime timestamp;
// }

class _Order {
  final OrderType type;
  final DateTime createdAt;
  final DateTime updatedAt;

  double _total = 0.0;
  final List<OrderItemHolder> _items = [];

  double get total => _total;
  List<OrderItemHolder> get items => List.from(_items, growable: false);

  _Order._({
    this.type,
    this.createdAt,
    this.updatedAt
  });

  factory _Order.create(OrderType type) {
    final time = DateTime.now();
    return _Order._(
      type: type,
      createdAt: time,
      updatedAt: time
    );
  }

  void addItem({
    @required OrderItem item,
    @required double price
  }) {
    assert(item != null);
    assert(item != null && price > 0.0);

    _items.add(OrderItemHolder(
      item: item, subtotal: price
    ));

    _total += price;
  }

  void removeAt(int index) {
    if (index > 0 && index < _items.length) {
      _total -= _items.removeAt(index).subtotal;
    }
  }

  bool canProceed() {
    return _items.isNotEmpty;
  }
}