// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finishing-material_orderable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FinishingMaterialOrderable _$FinishingMaterialOrderableFromJson(
    Map<String, dynamic> json) {
  return FinishingMaterialOrderable(
    product: json['product'] == null
        ? null
        : FinishingMaterial.fromJson(json['product']),
    qty: json['qty'] as int,
    price: (json['price'] as num)?.toDouble(),
    variants: json['variants'] as Map<String, dynamic>,
    selected: json['selected'] as bool,
  );
}

Map<String, dynamic> _$FinishingMaterialOrderableToJson(
        FinishingMaterialOrderable instance) =>
    <String, dynamic>{
      'product': instance.product,
      'qty': instance.qty,
      'price': instance.price,
      'variants': instance.variants,
      'selected': instance.selected,
    };
