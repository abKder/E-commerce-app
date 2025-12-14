import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:e_commerce/data/repositories/category/category_repository.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminCategoryController extends GetxController {
  static AdminCategoryController get instance => Get.find();

  final isLoading = false.obs;
  final categoryRepository = Get.put(CategoryRepository());
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;
      final list = await categoryRepository.getAllCategories();
      categories.assignAll(list);
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Form controls
  final nameController = TextEditingController();
  final isFeaturedReference = false.obs;
  // TODO: Add Image Picker Logic (String or File)

  // Init data for edit mode
  void init(CategoryModel? category) {
    if (category != null) {
      nameController.text = category.name;
      isFeaturedReference.value = category.isFeatured;
      // Image handling logic would go here
    } else {
      nameController.clear();
      isFeaturedReference.value = false;
    }
  }

  Future<void> saveCategory(CategoryModel? oldCategory) async {
    try {
      // Start Loading
      AFullScreenLoader.openLoadingDialog('Saving Category...',
          animation: AImages.loadingAnimation);

      // Check validation
      if (nameController.text.trim().isEmpty) {
        AFullScreenLoader.stopLoading();
        ASnackBarHelpers.warningSnackBar(
            title: 'Validation Error', message: 'Name is required');
        return;
      }

      // Create new model or update existing
      final newCategory = CategoryModel(
        id: oldCategory?.id ?? '',
        name: nameController.text.trim(),
        image: oldCategory?.image ?? '', // TODO: Handle new image
        isFeatured: isFeaturedReference.value,
        subCategory: oldCategory?.subCategory ?? [],
        parentId: oldCategory?.parentId ?? '',
      );

      // Save
      await categoryRepository.saveCategory(newCategory);

      // Stop Loading
      AFullScreenLoader.stopLoading();
      ASnackBarHelpers.successSnackBar(
          title: 'Success', message: 'Category Saved');

      // Refresh list
      fetchCategories();

      Get.back(); // Close form
    } catch (e) {
      AFullScreenLoader.stopLoading();
      ASnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> deleteCategory(String id) async {
    try {
      await categoryRepository.deleteCategory(id);
      ASnackBarHelpers.successSnackBar(
          title: 'Success', message: 'Category Deleted');
      fetchCategories();
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
