import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/authentication/models/user/user_model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///Function to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    }
    // on FirebaseAuthException catch (e) {
    //   throw "FB Exception";
      // throw TFirebaseAuthException(e.code).message;
    // } on FormatException catch (_) {
    //   throw "Format Exception";
    //   //throw const TFormatException();
    // } on PlatformException catch (e) {
    //   throw TPlatformException(e.code).message;
    // }
    catch (e) {
      throw 'Something went wrong. Please try again $e';
    }
  }

  ///Function to fetch user details based on user ID.
  ///Function to update user data in Firestore
  /// Update any field in specific Users Collection
}












