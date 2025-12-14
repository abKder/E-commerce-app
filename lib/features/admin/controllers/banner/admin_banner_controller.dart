import 'package:e_commerce/data/services/cloudinary_services.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_commerce/data/repositories/banners/banner_repository.dart';
import 'package:e_commerce/features/shop/models/banners_model.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminBannerController extends GetxController {
  static AdminBannerController get instance => Get.find();

  final bannerRepository = Get.put(BannerRepository());
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;
      final list = await bannerRepository.fetchAllBanners();
      banners.assignAll(list);
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Form controls
  final targetScreenController = TextEditingController();
  final isActive = false.obs;
  final Rx<XFile?> pickedImage = Rx<XFile?>(null);

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
  void init(BannerModel? banner) {
    if (banner != null) {
      targetScreenController.text = banner.targetScreen;
      isActive.value = banner.active;
      pickedImage.value = null; // Reset image picker
    } else {
      targetScreenController.clear();
      isActive.value = true;
      pickedImage.value = null;
    }
  }

  Future<void> saveBanner(BannerModel? oldBanner) async {
    try {
      // Start Loading
      AFullScreenLoader.openLoadingDialog('Saving Banner...',
          animation: AImages.loadingAnimation);

      // Check validation
      if (pickedImage.value == null &&
          (oldBanner == null || oldBanner.imageUrl.isEmpty)) {
        AFullScreenLoader.stopLoading();
        ASnackBarHelpers.warningSnackBar(
            title: 'Validation Error', message: 'Please select an image');
        return;
      }

      String imageUrl = oldBanner?.imageUrl ?? '';

      // Upload Image if new one is picked
      if (pickedImage.value != null) {
        final cloudinary =
            CloudinaryServices.instance; // Re-use existing instance or Get.put
        final response = await cloudinary.uploadImage(
            pickedImage.value!, AKeys.bannersFolder);
        if (response.statusCode == 200) {
          imageUrl = response.data['url'];
        } else {
          throw 'Image upload failed';
        }
      }

      // Create model
      final newBanner = BannerModel(
        id: oldBanner?.id ?? '',
        imageUrl: imageUrl,
        targetScreen: targetScreenController.text.trim(),
        active: isActive.value,
      );

      // Save
      await bannerRepository.saveBanner(newBanner);

      AFullScreenLoader.stopLoading();
      ASnackBarHelpers.successSnackBar(
          title: 'Success', message: 'Banner Saved');
      fetchBanners();
      Get.back();
    } catch (e) {
      AFullScreenLoader.stopLoading();
      ASnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  Future<void> deleteBanner(String id) async {
    try {
      await bannerRepository.deleteBanner(id);
      ASnackBarHelpers.successSnackBar(
          title: 'Success', message: 'Banner Deleted');
      fetchBanners();
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
