import 'dart:io';

import 'package:ecommerce_app/features/shop/models/product_category_model.dart';
import 'package:ecommerce_app/features/shop/models/product_model.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce_app/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Repository for managing product-related data and operations
class ProductRepository extends GetxController{
  static ProductRepository get instance => Get.find();

  /// Firestore instance for database interactions.
  final _db = FirebaseFirestore.instance;

  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();

    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  /// Get limited featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();

    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }

  /// Get products based on brand
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// get products based on the query
  Future<List<ProductModel>> getFavoriteProducts(List<String> productIds) async {
    try {
      final snapshot = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();
      return snapshot.docs.map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  Future<List<ProductModel>> getProductsForBrand({required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit ==  -1
          ? await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).get()
          : await _db.collection('Products').where('Brand.Id', isEqualTo: brandId).limit(limit).get();

      final products = querySnapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForCategory({required String categoryId, int limit = 4}) async {
    try {
      // query to get all documents where productId matches the provided categoryId & fetch limited or unlimited based on limit
      QuerySnapshot productCategoryQuery = limit ==  -1
          ? await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).get()
          : await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).limit(limit).get();

      // extract productsId from the documents
      List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();

      // query to get all documents where the brandId is in the list of brandIds, FieldPath.documentId to query documents in Collection
      final productsQuery = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();

      // extract brand names or other relevant data from the documents
      List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;

    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload dummy data to the Cloud firebase
  // Future<void> uploadDummyData(List<ProductModel> products) async {
  //   try{
  //     // Upload all the products along with their images
  //     final storage = Get.put(TFirebaseStorageService());
  //
  //     // Loop through each product
  //     for (var product in products) {
  //       // Get image data link from local assets
  //       final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);
  //
  //       // Upload image and get its URL
  //       final url = await storage.uploadImageData('Products/Images', thumbnail, product.thumbnail.toString());
  //
  //       //Assign URL to product.thumbnail attribute
  //       product.thumbnail = url;
  //
  //       // // Product list of images
  //       // if (product.images != null && product.images!.isNotEmpty) {
  //       //   List<String> imageUrl = [];
  //       //   for (var image in product.images!){
  //       //     // Get image data link from local assets
  //       //     final assetImage = await storage.getImageDataFromAssets(image);
  //       //
  //       //     // Upload image and get its URL
  //       //     final url = await storage.uploadImageData('Products/Images', assetImage, image);
  //       //
  //       //     // Assign URL to product.thumbnail attribute
  //       //     imageUrl.add(url);
  //       //   }
  //       //   product.images!.clear();
  //       //   product.images!.addAll(imageUrl);
  //       // }
  //       //
  //       // // Upload Variation Images
  //       // if (product.productType == ProductType.variable.toString()) {
  //       //   for (var variation in product.productVariations!) {
  //       //     // Get image data link from local assets
  //       //     final assetImage = await storage.getImageDataFromAssets(variation.image);
  //       //
  //       //     // Upload image and get its URL
  //       //     final url = await storage.uploadImageData('Products/Images', assetImage, variation.image);
  //       //
  //       //     // Assign URL to variation.image attribute
  //       //     variation.image = url;
  //       //   }
  //       // }
  //
  //       // Store product in firestore
  //       await _db.collection("Products").doc(product.id).set(product.toJson());
  //     }
  //   } on FirebaseException catch (e) {
  //     throw e.message!;
  //   } on SocketException catch (e) {
  //     throw e.message;
  //   } on PlatformException catch (e) {
  //     throw e.message!;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  Future<void> uploadDummyData(List<ProductCategoryModel> productCategories) async {
    try {
      // Loop through each category
      for (var productCategory in productCategories) {

        // Store BrandCategory in Firestore
        await _db.collection('ProductCategory').doc(productCategory.productId).set(productCategory.toJson());
        print("objectyyyyyyyyyyy");
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


