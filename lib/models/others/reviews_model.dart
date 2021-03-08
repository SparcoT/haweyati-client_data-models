import 'package:haweyati_client_data_models/data.dart';
import 'package:haweyati_client_data_models/models/order/driver_model.dart';
import 'package:haweyati_client_data_models/models/user/supplier_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'reviews_model.g.dart';

@JsonSerializable()
@HiveType(typeId: 128)
class Review {
 // Supplier supplier;
 Customer customer;
 // Driver driver;
 double supplierRating;
 double driverRating;
 String supplierFeedback;
 String driverFeedback;
 DateTime createdAt;
  Review({
   // this.driver,
   this.customer,
   // this.supplier,
   this.driverFeedback,this.driverRating,
    this.supplierFeedback,this.supplierRating,this.createdAt
  });

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
  factory Review.fromJson(json)=>_$ReviewFromJson(json);
}