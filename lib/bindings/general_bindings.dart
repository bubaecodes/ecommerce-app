import 'package:ecommerce_app/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/product/checkout_controller.dart';
import 'package:ecommerce_app/features/shop/controllers/product/variation_controller.dart';
import 'package:ecommerce_app/utils/helpers/network_manager.dart';
import 'package:get/get.dart';


class GeneralBindings extends Bindings {
  @override
  void dependencies (){
    Get.put(NetworkManager());
    Get.put(VariationController());
    //Get.put(CartController());
    Get.put(AddressController());
    Get.put(CheckoutController());
  }
}