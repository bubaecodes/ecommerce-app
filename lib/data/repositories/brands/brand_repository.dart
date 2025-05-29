import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/shop/models/brand_model.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// variables
  final _db = FirebaseFirestore.instance;

  // get all categories
  Future<List<BrandModel>> getAllBrands() async {
    try {

      final snapshot = await _db.collection('Brands').get();
      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching banners';
    }
  }

  // get brands for category
}