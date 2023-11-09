import 'package:cloud_firestore/cloud_firestore.dart';

class CouponModel {
  String discount;
  String headingText;
  String image;
  String subtitleText;

  CouponModel(
      {required this.discount,
      required this.headingText,
      required this.image,
      required this.subtitleText});

  factory CouponModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return CouponModel(
      discount: doc['discount'] ?? '',
      headingText: doc['headingText'] ?? '',
      image: doc['image'] ?? '',
      subtitleText: doc['subtitleText'] ?? '',
    );
  }
}
