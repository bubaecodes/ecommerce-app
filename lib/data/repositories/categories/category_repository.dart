import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/services/firebase_service/firebase_storage_service.dart';
import 'package:ecommerce_app/features/shop/models/category_model.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try{
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Get Sub Categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db.collection("Categories").where('ParentId', isEqualTo: categoryId).get();
      final result = snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Categories to the Cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // Upload all the Categories along with their images
      final storage = Get.put(TFirebaseStorageService());

      // Loop through each category
      for (var category in categories) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        //Upload Image and get its URL
        final url = await storage.uploadImageData('Categories', file, category.name);

        // Assign URL to Category.image attribute
        category.image = url;

        // Store Category in Firestore
        await _db.collection('Categories').doc(category.id).set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}


























