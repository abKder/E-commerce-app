import 'dart:math';

import 'package:e_commerce/common/widgets/screens/success_screen.dart';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/data/repositories/order/order_repository.dart';
import 'package:e_commerce/features/shop/controllers/cart/cart_controller.dart';
import 'package:e_commerce/features/shop/models/order_model.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final orderRepository = Get.put(OrderRepository());

  final userOrders = <OrderModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchUserOrders();
    super.onInit();
  }

  Future<void> fetchUserOrders() async {
    try {
      print('FetchUserOrders: Starting...');
      isLoading.value = true;
      print('FetchUserOrders: Calling Repository...');
      final userOrders = await orderRepository.fetchUserOrders();
      print('FetchUserOrders: Repository returned ${userOrders.length} orders');
      this.userOrders.assignAll(userOrders);
      print('FetchUserOrders: Assigned to Observable List');
    } catch (e) {
      print('FetchUserOrders: Error - $e');
      ASnackBarHelpers.warningSnackBar(
          title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
      print('FetchUserOrders: Finished (isLoading set to false)');
    }
  }

  // process order
  void processOrder(double totalAmount) async {
    try {
      // Start Loader
      AFullScreenLoader.openLoadingDialog('Processing your order...',
          animation: AImages.loadingAnimation);

      // Get User Auth Id
      final userId = AuthenticationRepository.instance.currentUser?.uid;
      if (userId == null || userId.isEmpty) {
        return;
      }

      // Add Random Date between 3-7 days
      // random number between 3 and 7
      final deliveryDate =
          DateTime.now().add(Duration(days: Random().nextInt(5) + 3));

      // Create Order
      final order = OrderModel(
        id: UniqueKey()
            .toString(), // Generate a unique ID (or let Firestore generate it)
        userId: userId,
        status: OrderStatus.processing,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: 'Paypal', // Static for now as per request/example
        deliveryDate: deliveryDate,
        items: cartController.cartItems.toList(),
      );

      // Save Order
      await orderRepository.saveOrder(order, userId);

      // Refresh orders list
      fetchUserOrders();

      // Clear Cart
      cartController.clearCart();

      // Show Success Screen
      Get.off(() => SuccessScreen(
            image: AImages.successfulPaymentIcon,
            title: 'Payment Success!',
            subTitle: 'Your item will be shipped soon!',
            onTap: () => Get.offAll(() => const NavigationMenu()),
          ));
    } catch (e) {
      AFullScreenLoader.stopLoading();
      ASnackBarHelpers.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
