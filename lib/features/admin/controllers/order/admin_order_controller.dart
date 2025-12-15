import 'package:e_commerce/data/repositories/order/order_repository.dart';
import 'package:e_commerce/features/shop/models/order_model.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class AdminOrderController extends GetxController {
  static AdminOrderController get instance => Get.find();

  final orderRepository = Get.put(OrderRepository());
  final RxList<OrderModel> allOrders = <OrderModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchAllOrders();
    super.onInit();
  }

  Future<void> fetchAllOrders() async {
    try {
      isLoading.value = true;
      final orders = await orderRepository.getAllOrders();
      allOrders.assignAll(orders);
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(
          title: 'Error', message: 'Failed to fetch orders: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateOrderStatus(
      OrderModel order, OrderStatus newStatus) async {
    try {
      // Optimistic Update
      ASnackBarHelpers.customToast(message: 'Updating Order Status...');

      await orderRepository.updateOrderStatus(
          order.id, order.userId, newStatus.toString());

      // Update local list
      final index = allOrders.indexWhere((o) => o.id == order.id);
      if (index != -1) {
        // Need to create copy with new status since class is immutable if we follow clean pattern
        // But for quick update, we might need a method in OrderModel to copyWith or just fetch again.
        // Let's just fetchAllOrders() for simplicity and consistency.
        fetchAllOrders();
      }

      ASnackBarHelpers.successSnackBar(
          title: 'Success',
          message: 'Order status updated to ${newStatus.name}');
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
