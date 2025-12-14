import 'dart:convert';
import 'package:e_commerce/data/repositories/product/product_repository.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class FavoritesController extends GetxController {
  static FavoritesController get instance => Get.find();

  // Variables
  final favorites = <String, bool>{}.obs;
  final localStorage = GetStorage();
  final productRepository = ProductRepository.to;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // Initialize favorites from storage
  Future<void> initFavorites() async {
    final json = localStorage.read('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      ASnackBarHelpers.customToast(
          message: 'Product has been added to the Wishlist.');
    } else {
      favorites.remove(productId);
      saveFavoritesToStorage();
      ASnackBarHelpers.customToast(
          message: 'Product has been removed from the Wishlist.');
    }
    favorites.refresh();
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = jsonEncode(favorites);
    localStorage.write('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> getFavoriteProducts() async {
    try {
      final productIds = favorites.keys.toList();
      if (productIds.isEmpty) return [];
      return await productRepository.getFavouriteProducts(productIds);
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}
