import 'package:e_commerce/data/repositories/brand/brand_repository.dart';
import 'package:e_commerce/data/services/cloudinary_services.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AdminBrandController extends GetxController {
  static AdminBrandController get instance => Get.find();

  final brandRepository = Get.put(BrandRepository());
  final RxList<BrandModel> brands = <BrandModel>[].obs;
  final isLoading = false.obs;

  // Form controls
  final nameController = TextEditingController();
  final isFeatured = false.obs;
  final Rx<XFile?> pickedImage = Rx<XFile?>(null);

  @override
  void onInit() {
    fetchBrands();
    super.onInit();
  }

  Future<void> fetchBrands() async {
    try {
      isLoading.value = true;
      final list = await brandRepository.getAllBrands();
      brands.assignAll(list);
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Image Picker
  Future<void> pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        pickedImage.value = image;
      }
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(
          title: 'Error', message: 'Failed to pick image: $e');
    }
  }

  // Init data for create/edit
  void init(BrandModel? brand) {
    if (brand != null) {
      nameController.text = brand.name;
      isFeatured.value = brand.isFeatured ?? false;
      pickedImage.value = null; // Reset image picker
    } else {
      nameController.clear();
      isFeatured.value = false;
      pickedImage.value = null;
    }
  }

  Future<void> saveBrand(BrandModel? oldBrand) async {
    try {
      // Start Loading
      AFullScreenLoader.openLoadingDialog('Saving Brand...',
          animation: AImages.loadingAnimation);

      // Validation
      if (nameController.text.trim().isEmpty) {
        AFullScreenLoader.stopLoading();
        ASnackBarHelpers.warningSnackBar(
            title: 'Validation Error', message: 'Name is required');
        return;
      }

      // Image Validation: New brand needs image (or placeholder if allowed, but brands usually have logos).
      // If oldBrand has image, fine. If not, and no new image picked, warn?
      // Assuming dummy image if none provided for now or strictly require.
      // Let's allow default logic: if picked, use it. Else old. Else empty/placeholder.

      String imageUrl = oldBrand?.image ?? '';

      // Upload Image if new one is picked
      if (pickedImage.value != null) {
        final cloudinary = CloudinaryServices.instance;
        final response = await cloudinary.uploadImage(
            pickedImage.value!, AKeys.brandsFolder);
        if (response.statusCode == 200) {
          imageUrl = response.data['url'];
        } else {
          throw 'Image upload failed';
        }
      }

      // Create model
      final newBrand = BrandModel(
        id: oldBrand?.id ?? '',
        name: nameController.text.trim(),
        image: imageUrl, // Model requires image. If empty, it's empty string.
        isFeatured: isFeatured.value,
        productsCount: oldBrand?.productsCount ?? 0,
      );

      // Save
      await brandRepository.saveBrand(newBrand);

      AFullScreenLoader.stopLoading();
      ASnackBarHelpers.successSnackBar(
          title: 'Success', message: 'Brand Saved');
      fetchBrands();
      Get.back();
    } catch (e) {
      AFullScreenLoader.stopLoading();
      ASnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> deleteBrand(String id) async {
    try {
      await brandRepository.deleteBrand(id);
      ASnackBarHelpers.successSnackBar(
          title: 'Success', message: 'Brand Deleted');
      fetchBrands();
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
