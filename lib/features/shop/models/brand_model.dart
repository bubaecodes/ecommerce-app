import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.image,
    required this.name,
    //this.isFeatured,
    this.isFeatured,
    this.productsCount
  });

  /// Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', image: '', name: '', isFeatured: true);

  /// Convert model to Json structure so that you can store data in Firebase
  toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'ProductsCount': productsCount,
      'IsFeatured': isFeatured,
    };
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'] ?? '',
      name: data['Name'] ?? '',
      image: data['Image'] ?? '',
      isFeatured: data['IsFeatured'] ?? false,
      productsCount: int.parse((data['ProductsCount'] ?? 0).toString()),
    );
  }

  /// Map Json oriented document snapshot from Firebase to UserModel
  /// i commented it coz it wasn't letting me do brand logo display tasks
  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON record to the model
      return BrandModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        productsCount: data['ProductsCount'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
      );
    } else {
      return BrandModel.empty();
    }
  }

  // factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
  //   final data = document.data();
  //   if (data == null) return BrandModel.empty();
  //
  //   return BrandModel(
  //     id: document.id,
  //     name: data['Name'] ?? '',
  //     image: data['Image'] ?? '',
  //     isFeatured: data['IsFeatured'] ?? false,
  //     productsCount: int.tryParse(data['ProductsCount']?.toString() ?? '0'),
  //   );
  // }
}











