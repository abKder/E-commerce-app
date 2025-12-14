import 'package:e_commerce/data/repositories/category/category_repository.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/data/repositories/brand/brand_repository.dart';
import 'package:e_commerce/data/repositories/product/product_repository.dart';
import 'package:e_commerce/data/services/cloudinary_services.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdminProductController extends GetxController {
  static AdminProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  final categoryRepository = Get.put(CategoryRepository());
  final brandRepository = Get.put(BrandRepository());
  final cloudinaryServices = Get.put(CloudinaryServices());

  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  RxList<ProductModel> allProducts = <ProductModel>[].obs;

  RxList<CategoryModel> categoryList = <CategoryModel>[].obs;
  Rx<CategoryModel?> selectedCategory = Rx<CategoryModel?>(null);

  RxList<BrandModel> brandList = <BrandModel>[].obs;
  Rx<BrandModel?> selectedBrand = Rx<BrandModel?>(null);

  Rx<XFile?> selectedImage = Rx<XFile?>(null);

  @override
  void onInit() {
    fetchFeaturedProducts();
    fetchCategories();
    fetchBrands();
    super.onInit();
  }

  void fetchCategories() async {
    try {
      final categories = await categoryRepository.getAllCategories();
      categoryList.assignAll(categories);
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(
          title: 'Error', message: 'Failed to fetch categories: $e');
    }
  }

  void fetchBrands() async {
    try {
      final brands = await brandRepository.getAllBrands();
      brandList.assignAll(brands);
    } catch (e) {
      print('Error fetching brands: $e');
    }
  }

  void pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      selectedImage.value = image;
    }
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      //Fetch Products
      final products = await productRepository.getAllProducts();

      //Assign Products
      allProducts.assignAll(products);
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      ASnackBarHelpers.customToast(message: 'Processing...');

      await productRepository.deleteProduct(productId);

      allProducts.removeWhere((product) => product.id == productId);

      Get.defaultDialog(
        title: 'Success',
        middleText: 'Product has been deleted successfully.',
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () => Get.back(),
        buttonColor: AColors.primary,
      );
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  Future<void> saveProduct(ProductModel product) async {
    try {
      ASnackBarHelpers.customToast(message: 'Saving Product...');

      String imageUrl = product.thumbnail;

      // Upload Image if selected
      if (selectedImage.value != null) {
        final response = await cloudinaryServices.uploadImage(
            selectedImage.value!, 'Product Images');
        if (response.statusCode == 200 &&
            response.data != null &&
            response.data['url'] != null) {
          imageUrl = response.data['url'];
        } else {
          ASnackBarHelpers.errorSnackBar(
              title: 'Upload Failed', message: 'Failed to upload image.');
          return;
        }
      }

      // Assign Category ID
      if (selectedCategory.value != null) {
        product.categoryId = selectedCategory.value!.id;
      }

      // Assign Brand
      if (selectedBrand.value != null) {
        product.brand = selectedBrand.value;
      }

      product.thumbnail = imageUrl;

      // Save to Repo
      await productRepository.saveProductRecord(product);

      // Update List (Simplified: Verify if exists or fetch all again)
      fetchFeaturedProducts();

      // Reset Selection
      selectedImage.value = null;
      selectedCategory.value = null;
      selectedBrand.value = null;

      Get.closeAllSnackbars();
      Get.back(); // Close Screen

      Get.defaultDialog(
        title: 'Success',
        middleText: 'Product has been saved successfully.',
        textConfirm: 'OK',
        confirmTextColor: Colors.white,
        onConfirm: () => Get.back(),
        buttonColor: AColors.primary,
      );
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
