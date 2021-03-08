import 'dart:io';
import 'dart:math';
import 'products/single-scaffolding_orderable.dart';
import 'products/delivery-vehicle_orderable.dart';
import 'package:hive/hive.dart';
import '../../data.dart';
import 'driver_model.dart';
import 'products/dumpster_orderable.dart';
import 'products/building-material_orderable.dart';
import 'products/finishing-material_orderable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:haweyati_client_data_models/data.dart';
import 'package:haweyati_client_data_models/model.dart';
import 'package:haweyati_client_data_models/models/time-slot_model.dart';
import 'package:haweyati_client_data_models/models/user/customer_model.dart';
import 'package:haweyati_client_data_models/models/user/supplier_model.dart';

part 'order_model.g.dart';

@HiveType(typeId: 190)
enum OrderType {
@HiveField(1)
@JsonValue('Construction Dumpster')
dumpster,@HiveField(2)
@JsonValue('Finishing Material')
finishingMaterial,@HiveField(3)
@JsonValue('Scaffolding')
scaffolding,@HiveField(0)
@JsonValue('Building Material')
buildingMaterial,@HiveField(4)
@JsonValue('Delivery Vehicle')
deliveryVehicle,}

@HiveType(typeId: 191)
enum OrderStatus {
@HiveField(0)
@JsonValue(0)
pending,@HiveField(1)
@JsonValue(1)
accepted,@HiveField(2)
@JsonValue(2)
preparing,@HiveField(3)
@JsonValue(3)
dispatched,@HiveField(4)
@JsonValue(4)
delivered,@HiveField(5)
@JsonValue(5)
rejected,@HiveField(6)
@JsonValue(6)
canceled,}

extension ExOrderStatus on OrderStatus {
  String get value {
    switch (this) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.accepted:
        return 'Accepted';
      case OrderStatus.preparing:
        return 'Preparing';
      case OrderStatus.dispatched:
        return 'Dispatched';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.rejected:
        return 'Rejected';
      case OrderStatus.canceled:
        return 'Canceled';
    }
  }
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
  ) {
    dropOffDate = DateTime.now();
  }

  void update(Location location) {
    city = location?.city;
    address = location?.address;
    latitude = location?.latitude;
    longitude = location?.longitude;
  }

  factory OrderLocation.fromAppData() {
    return OrderLocation()
      ..update(AppData().location);
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

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        'item': (item as dynamic).toJson(),
        'subtotal': subtotal,
        'supplier': supplier
      };
}

abstract class Purchasable extends BaseModelHive {}

abstract class OrderableProduct<T extends Purchasable> extends HiveObject {
  @HiveField(0)
  T product;

  OrderableProduct(this.product);

// T get product => _product;
// set product(T t) => _product = t;
}

// @HiveType(typeId: 179)
@JsonSerializable(includeIfNull: false)
class Order<T extends OrderableProduct> extends BaseModelHive {
  @HiveField(1)
  String city;
  @HiveField(2)
  String note;
  @JsonKey(name: 'orderNo')
  @HiveField(3)
  String number;
  @HiveField(4)
  double deliveryFee;

  String paymentType;
  String paymentIntentId;

  @HiveField(5)
  double _subtotal = 0.0;

  @JsonKey(name: 'service')
  @HiveField(6)
  OrderType type;
  @HiveField(7)
  OrderStatus status;

  @HiveField(8)
  Customer customer;

  @HiveField(9)
  OrderPayment payment;

  @JsonKey(name: 'dropoff', toJson: locationToJson, fromJson: locationFromJson)
  @HiveField(10)
  OrderLocation location;

  @HiveField(11)
  List<OrderImage> images;

  @JsonKey(ignore: true)
  @HiveField(12)
  List<OrderProductHolder<T>> products;

  @HiveField(13)
  DateTime createdAt;
  @HiveField(14)
  DateTime updatedAt;

  @HiveField(15)
  Driver driver;

  @JsonKey(ignore: true)
  @HiveField(16)
  File image;

  @HiveField(17)
  Supplier supplier;

  @HiveField(18)
  String tripId;

  @HiveField(19)
  String shareUrl;

  @HiveField(10)
  double rating;

  @HiveField(20)
  double rewardPointsValue;

  @HiveField(21)
  double vat;

  @HiveField(22)
  Map<String, dynamic> supplierCancellationReason;

  @HiveField(23)
  String coupon;

  @HiveField(24)
  double couponValue;

  // @JsonKey(name: 'total')
  // @HiveField(16)
  // double orderTotal;

  Order(this.type, {
    this.note,
    this.number
  }) {
    images ??= [];
    products ??= [];
    location ??= OrderLocation.fromAppData();
  }

  // OrderLocation get location => _location;
  // set location(OrderLocation location) {
  //   if (location != null) {
  //     _location = location;
  //   }
  // }

  Map<String, dynamic> toJson() =>
      _$OrderToJson(this)
        ..addAll({'items': products.map((e) => e.toJson()).toList()});

  factory Order.fromJson(json) {
    final order = _$OrderFromJson(json);

    order.products.addAll(_parseProducts(json['items'], order.type));
    order.total = json['total']?.toDouble();
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
  static const vatVal = .15;

  double get subtotal => _subtotal;

  double get total => max(0, subtotal + (subtotal * vatVal) - (rewardPointsValue ?? 0) -
          (couponValue ?? 0));

  double get totalWithoutVat => _subtotal;

  set total(double val) {
    _subtotal = val;
  }


  void addImage(File file) async {
    image = file;
  }

  void removeImage() {
    image = null;
  }

  void addProduct(T product, double price) {
    assert(product != null && price != null);
    products.add(OrderProductHolder(
      item: product,
      subtotal: price,
    ));

    _subtotal += price;
    vat = _subtotal * vatVal;
  }

  void clearProducts() {
    products.clear();
    _subtotal = 0;
  }
}

Iterable<OrderProductHolder> _parseProducts(List<dynamic> products,
    OrderType type,) {
  switch (type) {
    case OrderType.buildingMaterial:
      return products.map((product) =>
          OrderProductHolder(
              item: BuildingMaterialOrderable.fromJson(product['item']),
              supplier: product['supplier'],
              subtotal: product['subtotal']?.toDouble()
          ));
    case OrderType.dumpster:
      return products.map((product) =>
          OrderProductHolder(
              item: DumpsterOrderable.fromJson(product['item']),
              supplier: product['supplier'],
              subtotal: product['subtotal']?.toDouble()
          ));
    case OrderType.finishingMaterial:
      return products.map((product) =>
          OrderProductHolder(
              item: FinishingMaterialOrderable.fromJson(product['item']),
              supplier: product['supplier'],
              subtotal: product['subtotal']?.toDouble()
          ));
    case OrderType.scaffolding:
      return products.map((product) =>
          OrderProductHolder(
              item: SingleScaffoldingOrderable.fromJson(product['item']),
              supplier: product['supplier'],
              subtotal: product['subtotal']?.toDouble()
          ));
    case OrderType.deliveryVehicle:
      return products.map((product) =>
          OrderProductHolder(
              item: DeliveryVehicleOrderable.fromJson(product['item']),
              supplier: product['supplier'],
              subtotal: product['subtotal']?.toDouble()
          ));
  }


  return [];
}


Map<String, dynamic> locationToJson(OrderLocation location) =>
    {
      'dropoffLocation': {
        'longitude': location.longitude,
        'latitude': location.latitude
      },
      'dropoffAddress': location.address,
      'dropoffDate': location.dropOffDate.millisecondsSinceEpoch,
      'dropoffTime': location.dropOffTime != null ? TimeSlot.toJson(
          location.dropOffTime) : null,
      'city': location.city
    };

OrderLocation locationFromJson(Map<String, dynamic> json) {
  return OrderLocation(
    longitude: json['dropoffLocation']['longitude'],
    latitude: json['dropoffLocation']['latitude'],
    dropOffDate: DateTime.parse(json['dropoffDate']),
    dropOffTime: TimeSlot.fromJson(json['dropoffTime']),
  )
    ..address = json['dropoffAddress'];
}

