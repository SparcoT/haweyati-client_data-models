// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderTypeAdapter extends TypeAdapter<OrderType> {
  @override
  final int typeId = 190;

  @override
  OrderType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return OrderType.dumpster;
      case 2:
        return OrderType.finishingMaterial;
      case 3:
        return OrderType.scaffolding;
      case 0:
        return OrderType.buildingMaterial;
      case 4:
        return OrderType.deliveryVehicle;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, OrderType obj) {
    switch (obj) {
      case OrderType.dumpster:
        writer.writeByte(1);
        break;
      case OrderType.finishingMaterial:
        writer.writeByte(2);
        break;
      case OrderType.scaffolding:
        writer.writeByte(3);
        break;
      case OrderType.buildingMaterial:
        writer.writeByte(0);
        break;
      case OrderType.deliveryVehicle:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderStatusAdapter extends TypeAdapter<OrderStatus> {
  @override
  final int typeId = 191;

  @override
  OrderStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return OrderStatus.pending;
      case 1:
        return OrderStatus.accepted;
      case 2:
        return OrderStatus.preparing;
      case 3:
        return OrderStatus.dispatched;
      case 4:
        return OrderStatus.delivered;
      case 5:
        return OrderStatus.rejected;
      case 6:
        return OrderStatus.canceled;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, OrderStatus obj) {
    switch (obj) {
      case OrderStatus.pending:
        writer.writeByte(0);
        break;
      case OrderStatus.accepted:
        writer.writeByte(1);
        break;
      case OrderStatus.preparing:
        writer.writeByte(2);
        break;
      case OrderStatus.dispatched:
        writer.writeByte(3);
        break;
      case OrderStatus.delivered:
        writer.writeByte(4);
        break;
      case OrderStatus.rejected:
        writer.writeByte(5);
        break;
      case OrderStatus.canceled:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderImageAdapter extends TypeAdapter<OrderImage> {
  @override
  final int typeId = 193;

  @override
  OrderImage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderImage(
      sort: fields[0] as String,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OrderImage obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.sort)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderImageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderLocationAdapter extends TypeAdapter<OrderLocation> {
  @override
  final int typeId = 194;

  @override
  OrderLocation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderLocation(
      latitude: fields[2] as double,
      longitude: fields[3] as double,
      dropOffTime: fields[4] as TimeSlot,
      dropOffDate: fields[5] as DateTime,
    )
      ..city = fields[0] as String
      ..address = fields[1] as String;
  }

  @override
  void write(BinaryWriter writer, OrderLocation obj) {
    writer
      ..writeByte(6)
      ..writeByte(4)
      ..write(obj.dropOffTime)
      ..writeByte(5)
      ..write(obj.dropOffDate)
      ..writeByte(0)
      ..write(obj.city)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.latitude)
      ..writeByte(3)
      ..write(obj.longitude);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderLocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class OrderPaymentAdapter extends TypeAdapter<OrderPayment> {
  @override
  final int typeId = 180;

  @override
  OrderPayment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderPayment(
      type: fields[0] as String,
      intentId: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OrderPayment obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.intentId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderPaymentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderImage _$OrderImageFromJson(Map<String, dynamic> json) {
  return OrderImage(
    sort: json['sort'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$OrderImageToJson(OrderImage instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('sort', instance.sort);
  writeNotNull('name', instance.name);
  return val;
}

OrderLocation _$OrderLocationFromJson(Map<String, dynamic> json) {
  return OrderLocation(
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    dropOffTime: TimeSlot.fromJson(json['dropOffTime']),
    dropOffDate: json['dropOffDate'] == null
        ? null
        : DateTime.parse(json['dropOffDate'] as String),
  )
    ..city = json['city'] as String
    ..address = json['address'] as String;
}

Map<String, dynamic> _$OrderLocationToJson(OrderLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('city', instance.city);
  writeNotNull('address', instance.address);
  writeNotNull('latitude', instance.latitude);
  writeNotNull('longitude', instance.longitude);
  writeNotNull('dropOffTime', TimeSlot.toJson(instance.dropOffTime));
  writeNotNull('dropOffDate', instance.dropOffDate?.toIso8601String());
  return val;
}

OrderPayment _$OrderPaymentFromJson(Map<String, dynamic> json) {
  return OrderPayment(
    type: json['type'] as String,
    intentId: json['intentId'] as String,
  );
}

Map<String, dynamic> _$OrderPaymentToJson(OrderPayment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', instance.type);
  writeNotNull('intentId', instance.intentId);
  return val;
}

Order<T> _$OrderFromJson<T extends OrderableProduct<Purchasable>>(
    Map<String, dynamic> json) {
  return Order<T>(
    _$enumDecodeNullable(_$OrderTypeEnumMap, json['service']),
    note: json['note'] as String,
    number: json['orderNo'] as String,
  )
    ..id = json['_id'] as String
    ..city = json['city'] as String
    ..deliveryFee = (json['deliveryFee'] as num)?.toDouble()
    ..paymentType = json['paymentType'] as String
    ..paymentIntentId = json['paymentIntentId'] as String
    ..status = _$enumDecodeNullable(_$OrderStatusEnumMap, json['status'])
    ..customer =
        json['customer'] == null ? null : Customer.fromJson(json['customer'])
    ..payment =
        json['payment'] == null ? null : OrderPayment.fromJson(json['payment'])
    ..location = locationFromJson(json['dropoff'] as Map<String, dynamic>)
    ..images = (json['images'] as List)
        ?.map((e) => e == null ? null : OrderImage.fromJson(e))
        ?.toList()
    ..createdAt = json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String)
    ..updatedAt = json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String)
    ..driver = json['driver'] == null
        ? null
        : Driver.fromJson(json['driver'] as Map<String, dynamic>)
    ..supplier =
        json['supplier'] == null ? null : Supplier.fromJson(json['supplier'])
    ..tripId = json['tripId'] as String
    ..shareUrl = json['shareUrl'] as String
    ..rating = (json['rating'] as num)?.toDouble()
    ..rewardPointsValue = (json['rewardPointsValue'] as num)?.toDouble()
    ..vat = (json['vat'] as num)?.toDouble()
    ..supplierCancellationReason =
        json['supplierCancellationReason'] as Map<String, dynamic>
    ..coupon = json['coupon'] as String
    ..couponValue = (json['couponValue'] as num)?.toDouble()
    ..total = (json['total'] as num)?.toDouble();
}

Map<String, dynamic> _$OrderToJson<T extends OrderableProduct<Purchasable>>(
    Order<T> instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_id', instance.id);
  writeNotNull('city', instance.city);
  writeNotNull('note', instance.note);
  writeNotNull('orderNo', instance.number);
  writeNotNull('deliveryFee', instance.deliveryFee);
  writeNotNull('paymentType', instance.paymentType);
  writeNotNull('paymentIntentId', instance.paymentIntentId);
  writeNotNull('service', _$OrderTypeEnumMap[instance.type]);
  writeNotNull('status', _$OrderStatusEnumMap[instance.status]);
  writeNotNull('customer', instance.customer);
  writeNotNull('payment', instance.payment);
  writeNotNull('dropoff', locationToJson(instance.location));
  writeNotNull('images', instance.images);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  writeNotNull('driver', instance.driver);
  writeNotNull('supplier', instance.supplier);
  writeNotNull('tripId', instance.tripId);
  writeNotNull('shareUrl', instance.shareUrl);
  writeNotNull('rating', instance.rating);
  writeNotNull('rewardPointsValue', instance.rewardPointsValue);
  writeNotNull('vat', instance.vat);
  writeNotNull(
      'supplierCancellationReason', instance.supplierCancellationReason);
  writeNotNull('coupon', instance.coupon);
  writeNotNull('couponValue', instance.couponValue);
  writeNotNull('total', instance.total);
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$OrderTypeEnumMap = {
  OrderType.dumpster: 'Construction Dumpster',
  OrderType.finishingMaterial: 'Finishing Material',
  OrderType.scaffolding: 'Scaffolding',
  OrderType.buildingMaterial: 'Building Material',
  OrderType.deliveryVehicle: 'Delivery Vehicle',
};

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 0,
  OrderStatus.accepted: 1,
  OrderStatus.preparing: 2,
  OrderStatus.dispatched: 3,
  OrderStatus.delivered: 4,
  OrderStatus.rejected: 5,
  OrderStatus.canceled: 6,
};
