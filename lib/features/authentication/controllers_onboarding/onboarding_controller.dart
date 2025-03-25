import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController{
  static OnBoardingController get instance => Get.find();

  ///Variables
  final pageController = PageController();
  RxInt currentPageIndex = 0.obs;

  ///Update Current Index when Page Scrolls
  void updatePageIndicator(index) => currentPageIndex.value = index;

  ///Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  ///Update Current Index & jump to next page
  void nextPage(index) {
    if(currentPageIndex.value == 2) {
      Get.to(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  ///Update Current Index & jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}