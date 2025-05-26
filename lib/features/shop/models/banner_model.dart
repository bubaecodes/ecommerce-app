import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  BannerModel({required this.id, required this.imageUrl, required this.targetScreen, required this.active});

  String id;
  String imageUrl;
  final String targetScreen;
  final bool active;

  /// Empty Helper Function
  static BannerModel empty() =>
      BannerModel(id: '', imageUrl: '', targetScreen: '', active: false);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
      'Active': active,
    };
  }

  // factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
  //   final data = snapshot.data() as Map<String, dynamic>;
  //   return BannerModel(
  //     id: data['id'],
  //     imageUrl: data['ImageUrl'] ?? '',
  //     targetScreen: data['TargetScreen'] ?? '',
  //     active: data['Active'] ?? false,
  //   );
  // }

  /// Map Json oriented document snapshot from firebase to UserModel
  factory BannerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // Map JSON Record to the Model
      return BannerModel(
        id: document.id,
        imageUrl: data['ImageUrl'] ?? '',
        targetScreen: data['TargetScreen'] ?? '',
        active: data['Active'] ?? false,
      );
    } else {
      return BannerModel.empty();
    }
  }
}









