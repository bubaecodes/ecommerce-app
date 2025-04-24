import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  ///Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///Called from main.dart on app launch
  @override
  void onReady() {
    // Remove from main.dart on app launch
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  ///Function to show Relevant Screen
  screenRedirect() async {
    //Local Storage
    if(kDebugMode) {
      print('=====GET STORAGE Auth Repo===---======');
      print(deviceStorage.read('IsFirstTime'));
    }
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(const OnBoardingScreen());
  }

  /*--------------------------- Email & Password sign-in ---------------------------*/

  ///[Email Authentication] - SignIn


  ///[Email Authentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException {
      throw  "this is error 1";
      // throw TFirebaseAuthException(e.code).message;
    } on FirebaseException {
      throw  "this is error 2";
      // throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw  "this is error 3";
      // throw const TFormatException();
    } on PlatformException {
      throw  "this is error 4";
      // throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  ///[ReAuthenticate] - ReAuthenticate User



  ///[Email Verification] - Mail Verification
  ///[Email Verification] - Forgot Password


  /*--------------------------- Federated identity & social sign-in ---------------------------*/

  ///[Google Authentication] - Google
  ///[Facebook Authentication] - Facebook


  /*--------------------------- ./end Federated identity & social sign-in ---------------------------*/

  ///[Logout User] - Valid for any authentication
  ///[Delete User] - Remove user Auth and Firestore Account
}