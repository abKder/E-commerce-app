import 'package:e_commerce/features/shop/controllers/cart/cart_controller.dart';
import 'package:e_commerce/features/shop/controllers/product/favorites_controller.dart';
import 'package:e_commerce/features/shop/controllers/product/product_controller.dart'; // Import ProductController
import 'package:get/get.dart';
import '../utils/helpers/network_manager.dart';

class ABindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(ProductController()); // Register ProductController first
    Get.put(FavoritesController()); // Register FavoritesController
    Get.put(CartController());
  }
}
