import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:ecommerce_app/utils/local_storage/storage_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance => Get.find();

  ///Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  ///Get Authenticated User Data
  User? get authUser => _auth.currentUser;

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
    final user = _auth.currentUser;

    if(user != null){

      // if user is logged in
      if(user.emailVerified){

        // initialize user specific storage
        await TLocalStorage.init(user.uid);

        // if the user's email is verified, navigate to the main navigation menu
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email,));
      }
    } else {
      //Local Storage
      deviceStorage.writeIfNull('IsFirstTime', true);
      // Check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(const OnBoardingScreen());
    }
  }

  /*--------------------------- Email & Password sign-in ---------------------------*/

  ///[Email Authentication] - LOGIN
  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  ///[Email Authentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// [Email Verification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      //throw  "this is error 4";
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  ///[ReAuthenticate] - ReAuthenticate User
  Future<void> reAuthenticateWithEmailAndPassword(String email, String password) async {
    try {
      // Create a credential
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

      // ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      //throw  "this is error 4";
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again $e';
    }
  }


  ///[Email Verification] - Forgot Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      //throw  "this is error 4";
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  /*--------------------------- Federated identity & social sign-in ---------------------------*/

  ///[Google Authentication] - Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken
      );

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      //throw  "this is error 4";
      throw TPlatformException(e.code).message;
    } catch (e) {
      if (kDebugMode) print('Something went wrong: $e');
      return null;
    }
  }

  ///[Facebook Authentication] - Facebook


  /*--------------------------- ./end Federated identity & social sign-in ---------------------------*/

  ///[Logout User] - Valid for any authentication
  Future<void> logout() async {
    print('logout please========');
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }


  ///[Delete User] - Remove user Auth and Firestore Account
  // Future<void> deleteAccount() async {
  //   try {
  //     await UserRepository.instance.removeUserRecord(_auth.currentUser!.uid);
  //     await _auth.currentUser?.delete();
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthException(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw 'Something went wrong. Please try again';
  //   }
  // }

  Future<void> deleteAccount() async {
    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw Exception('No user is currently signed in.');
      }

      // await UserRepository.instance.removeUserRecord(user.uid);
      await user.delete();

    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code); // or just rethrow
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code);
    } on FormatException {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code);
    } catch (e) {
      throw Exception('Something went wrong. Please try again.');
    }
  }

}