import 'package:haweyati_client_data_models/data.dart';

class ShareableData {
  String id;
  OrderType type;
  String socialMediaTitle;
  String socialMediaDescription;

  ShareableData({
    this.id,
    this.type,
    this.socialMediaTitle,
    this.socialMediaDescription
  });
}