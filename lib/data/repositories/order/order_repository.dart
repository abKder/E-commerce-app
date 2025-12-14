import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/features/shop/models/order_model.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userId = AuthenticationRepository.instance.currentUser?.uid;
      if (userId == null || userId.isEmpty) {
        throw 'Unable to find user information. Try again later';
      }

      final result =
          await _db.collection('Users').doc(userId).collection('Orders').get();
      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      print('Error fetching orders: $e');
      throw 'Something went wrong while fetching Order Information. Try again later';
    }
  }

  Future<void> saveOrder(OrderModel order, String userId) async {
    print('Processing Order: Saving to repository...');
    print(
        'Processing Order: Order object created. Items: ${order.items.length}');
    try {
      final res = await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.toJson());
      print('Processing Order: Order saved to repository');
      print('Processing Order: Order ID: ${res.id}');
      final orders = await fetchUserOrders();
      print(
          'Processing Order: Orders fetched from repository: ${orders.length}');
    } catch (e) {
      throw 'Something went wrong while saving Order Information. Try again later';
    }
  }

  // Fetch all orders from all users (Admin)
  Future<List<OrderModel>> getAllOrders() async {
    try {
      final result = await _db.collectionGroup('Orders').get();
      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'Something went wrong while fetching Orders. Try again later';
    }
  }

  // Update Order Status (Admin)
  Future<void> updateOrderStatus(
      String orderId, String userId, String status) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .doc(orderId)
          .update({'status': status});
    } catch (e) {
      throw 'Something went wrong while updating Order Status. Try again later';
    }
  }
}
