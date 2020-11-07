import 'dart:io';

import 'package:hive/hive.dart';
import 'products/dumpster_orderable.dart';
import 'products/building-material_orderable.dart';
import 'products/finishing-material_orderable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/data.dart';
import 'package:haweyati_client_data_models/model.dart';
import 'package:haweyati_client_data_models/models/time-slot_model.dart';
import 'package:haweyati_client_data_models/models/user/customer_model.dart';
import 'package:haweyati_client_data_models/models/others/location_model.dart';

part 'order_model.g.dart';

@HiveType(typeId: 190)
enum OrderType {
  @HiveField(0)
  @JsonValue('Building Material')
  buildingMaterial,
  @HiveField(1)
  @JsonValue('Construction Dumpster')
  dumpster,
  @HiveField(2)
  @JsonValue('Finishing Material')
  finishingMaterial,
  @HiveField(3)
  @JsonValue('Scaffolding')
  scaffolding,
}

@HiveType(typeId: 191)
enum OrderStatus {
  @HiveField(0)
  @JsonValue(0)
  pending,
  @HiveField(1)
  @JsonValue(1)
  approved,
  @HiveField(2)
  @JsonValue(2)
  accepted,
  @HiveField(3)
  @JsonValue(3)
  preparing,
  @HiveField(4)
  @JsonValue(4)
  dispatched,
  @HiveField(5)
  @JsonValue(5)
  delivered,
  @HiveField(6)
  @JsonValue(6)
  rejected,
  @HiveField(7)
  @JsonValue(7)
  canceled
}

// TODO: Use this.
// @HiveType(typeId: 192)
// enum PaymentType {
//   @HiveField(0)
//   applePay,
//   @HiveField(1)
//   cashOnDelivery,
//   @HiveField(2)
//   creditCard,
//   @HiveField(3)
//   mada
// }

@HiveType(typeId: 193)
@JsonSerializable(includeIfNull: false)
class OrderImage {
  @HiveField(0)
  String sort;
  @HiveField(1)
  String name;

  OrderImage({this.sort, this.name});
  Map<String, dynamic> toJson() => _$OrderImageToJson(this);
  factory OrderImage.fromJson(json) => _$OrderImageFromJson(json);
}

@HiveType(typeId: 194)
@JsonSerializable(includeIfNull: false)
class OrderLocation extends Location {
  @HiveField(4)
  @JsonKey(fromJson: TimeSlot.fromJson, toJson: TimeSlot.toJson)
  TimeSlot dropOffTime;
  @HiveField(5)
  DateTime dropOffDate;

  OrderLocation({
    double latitude,
    double longitude,
    this.dropOffTime,
    this.dropOffDate,
  }) : super(
          latitude: 2,
          longitude: 1,
        );

  void update(Location location) {
    city = location?.city;
    address = location?.address;
    latitude = location?.latitude;
    longitude = location?.longitude;
  }

  factory OrderLocation.fromAppData() {
    return OrderLocation()..update(AppData().location);
  }

  @override
  Map<String, dynamic> toJson() => _$OrderLocationToJson(this);
  factory OrderLocation.fromJson(json) => _$OrderLocationFromJson(json);
}

@HiveType(typeId: 180)
@JsonSerializable(includeIfNull: false)
class OrderPayment {
  @HiveField(0)
  String type;
  @HiveField(1)
  String intentId;

  OrderPayment({this.type, this.intentId});

  Map<String, dynamic> toJson() => _$OrderPaymentToJson(this);
  factory OrderPayment.fromJson(json) => _$OrderPaymentFromJson(json);
}

class OrderProductHolder<T extends OrderableProduct> {
  T item;
  double subtotal;
  String supplier;

  OrderProductHolder({this.item, this.supplier, this.subtotal});

  Map<String, dynamic> toJson() => <String, dynamic>{
        'item': (item as dynamic).toJson(),
        'subtotal': subtotal,
        'supplier': supplier
      };
}

abstract class Purchasable extends BaseModelHive {}

abstract class OrderableProduct<T extends Purchasable> extends HiveObject {
  @HiveField(0)
  Purchasable _product;
  OrderableProduct(this._product);

  T get product => _product;
  set product(T t) => _product = t;
}

@HiveType(typeId: 179)
@JsonSerializable(includeIfNull: false)
class Order<T extends OrderableProduct> extends BaseModelHive {
  String city;
  String note;
  String number;
  double deliveryFee;

  double _subtotal = 0.0;

  OrderType type;
  OrderStatus status;

  Customer customer;

  OrderPayment payment;
  OrderLocation _location;

  List<OrderImage> images;

  @JsonKey(ignore: true)
  List<OrderProductHolder> products;

  DateTime createdAt;
  DateTime updatedAt;

  Order({
    this.note,
    this.number,
  }) {
    images ??= [];
    products ??= [];
    _location ??= OrderLocation.fromAppData();
  }

  Map<String, dynamic> toJson() => _$OrderToJson(this)
    ..addAll({'items': products.map((e) => e.toJson()).toList()});
  factory Order.fromJson(json) {
    final order = _$OrderFromJson(json);

    order.products.addAll(_parseProducts(json['items'], order.type));
    switch (order.type) {
      case OrderType.buildingMaterial:
        break;
      case OrderType.dumpster:
        break;
      case OrderType.finishingMaterial:
        break;
      case OrderType.scaffolding:
        break;
    }

    return order;
  }

  /// Value Added Tax (15%);
  static const vat = .15;

  double get subtotal => _subtotal;
  double get total => subtotal * vat;

  void addImage(File file) {}

  void removeImage(int index) {
    images.removeAt(index);
  }

  void addProduct(T product, double price) {
    assert(product != null && price != null);
    products.add(OrderProductHolder(
      item: product,
      subtotal: price,
    ));

    _subtotal += price;
  }

  void clearProducts() => products.clear();
}

Iterable<OrderProductHolder> _parseProducts(
    List<dynamic> products,
    OrderType type,
    ) {
  switch (type) {
    case OrderType.buildingMaterial:
      return products.map((product) => OrderProductHolder(
          item: BuildingMaterialOrderable.fromJson(product),
          supplier: product['supplier'],
          subtotal: product['subtotal']
      ));
    case OrderType.dumpster:
      return products.map((product) => OrderProductHolder(
          item: DumpsterOrderable.fromJson(product),
          supplier: product['supplier'],
          subtotal: product['subtotal']
      ));
    case OrderType.finishingMaterial:
      return products.map((product) => OrderProductHolder(
          item: FinishingMaterialOrderable.fromJson(product),
          supplier: product['supplier'],
          subtotal: product['subtotal']
      ));
    case OrderType.scaffolding:
    //   return products.map((product) => OrderProductHolder(
    //     item: BuildingMaterialOrderable.fromJson(product),
    //     supplier: product['supplier'],
    //     subtotal: product['subtotal']
    //   ));
  }

  return [];
}

