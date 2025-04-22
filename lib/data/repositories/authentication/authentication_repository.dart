import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  ///Variables
  final deviceStorage = GetStorage();

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