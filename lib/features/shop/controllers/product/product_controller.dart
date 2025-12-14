import 'package:e_commerce/data/repositories/product/product_repository.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> allProducts = <ProductModel>[].obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      // Fetch Products
      final products = await productRepository.getAllProducts();

      // Assign All Products
      allProducts.assignAll(products);

      // Filter Popular Products (Sale Price > 0)
      featuredProducts.assignAll(
          allProducts.where((product) => product.salePrice > 0).toList());
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Get Products specific to a Category
  List<ProductModel> getProductsByCategory(String categoryId) {
    return allProducts
        .where((product) => product.categoryId == categoryId)
        .toList();
  }
}
