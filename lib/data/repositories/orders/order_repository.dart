import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/features/shop/models/order_model.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController{
  static OrderRepository get instance => Get.find();

  /// variables
  final _db = FirebaseFirestore.instance;

  /// get all order related to current user
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      //final userId = AuthenticationRepository.instance.authUser.uid;
      final userId = AuthenticationRepository.instance.authUser?.uid;
      //if(userId.isEmpty) throw 'Unable to find user information. Tey again in few minutes.';
      if(userId!.isEmpty) throw 'Unable to find user information. Tey again in few minutes.';

      final result = await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs.map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot)).toList();
      //return result.docs.map((documentSnapshot) => OrderModel.fromSnaphot(documentSnapshot)).toList();
    } catch (e) {
      throw 'Something went wrong while fetching Order Information. Try again later.';
    }
  }

  /// store new user order
  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db.collection('Users').doc(userId).collection('Orders').add(order.toJson());
    } catch (e) {
      throw 'Something went wrong while saving Order Information. Try again later';
    }
  }
}




