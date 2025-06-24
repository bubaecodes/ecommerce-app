import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/shop/models/brand_category_model.dart';
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

  /// get all categories
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


  /// get brands for category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery = await _db.collection('BrandCategory').where('categoryId', isEqualTo: categoryId).get();

      // extract brandIds from the documents
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

      // query to get all documents where the brandId is in the list of brandIds, FieldPath.documentId to query documents in Collection
      final brandsQuery = await _db.collection('Brands').where(FieldPath.documentId, whereIn: brandIds).limit(2).get();

      // extract brand names or other relevant data from the documents
      List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;

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

  /// Upload dummy data to the Cloud firebase
  // Future<void> uploadDummyData(List<BrandModel> brands) async {
  //   try{
  //     // Upload all the brands along with their images
  //     final storage = Get.put(TFirebaseStorageService());
  //
  //     // Loop through each product
  //     for (var brand in brands) {
  //       // Get image data link from local assets
  //       //final image = await storage.getImageDataFromAssets(brand.image);
  //       final file = await storage.getImageDataFromAssets(brand.image);
  //
  //       // Upload image and get its URL
  //       //final url = await storage.uploadImageData('Brands/Image', image, brand.image.toString());
  //       final url = await storage.uploadImageData('Brands', file, brand.image.toString());
  //
  //       //Assign URL to product.image attribute
  //       brand.image = url;
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
  //       await _db.collection("Brands").doc(brand.id).set(brand.toJson());
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

  // Future<void> uploadDummyData(List<BrandModel> brands) async {
  //   try {
  //     // Upload all the Brands along with their images
  //     final storage = Get.put(TFirebaseStorageService());
  //
  //     // Loop through each category
  //     for (var brand in brands) {
  //       // Get ImageData link from the local assets
  //       // final file = await storage.getImageDataFromAssets(brand.image);
  //       //
  //       // //Upload Image and get its URL
  //       // final url = await storage.uploadImageData('Brands', file, brand.image);
  //
  //       final image = await storage.getImageDataFromAssets(brand.image);
  //
  //       // Upload image and get its URL
  //       final url = await storage.uploadImageData('Brands/Images', image, brand.image.toString());
  //
  //       // Assign URL to Brand.image attribute
  //       brand.image = url;
  //
  //       // Store Brand in Firestore
  //       await _db.collection('Brands').doc(brand.id).set(brand.toJson());
  //     }
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  Future<void> uploadDummyData(List<BrandCategoryModel> brandCategories) async {
    try {
      // Loop through each category
      for (var brandCategory in brandCategories) {

        // Store BrandCategory in Firestore
        await _db.collection('BrandCategory').doc(brandCategory.brandId).set(brandCategory.toJson());
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









