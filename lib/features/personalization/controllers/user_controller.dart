import 'dart:io';

import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/features/personalization/screens/edit_profile/widgets/re_authentication_user_form.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'
    show ElevatedButton, Colors, OutlinedButton;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/repositories/authentication_repository.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../authentication/models/user_model.dart';
import 'package:dio/dio.dart' as dio;

class UserController extends GetxController {
  static UserController get instance => Get.find();

  // variable
  final _userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  RxBool profileLoading = false.obs;

  //reauthentication variable
  final email = TextEditingController();
  final password = TextEditingController();
  final reAuthFormKey = GlobalKey<FormState>();
  RxBool isPasswordVisible = false.obs;

  @override
  void onInit() {
    fetchUserDetails();
    super.onInit();
  }

  //fetch user details
  Future<void> fetchUserDetails() async {
    try {
      profileLoading.value = true;
      UserModel user = await _userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(ASizes.md),
        title: 'Delete Account',
        middleText:
            'Are you sure you want to delete account Permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
            onPressed: () async => deleteUserAccount(),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: ASizes.lg),
              child: Text('Delete'),
            )),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text('Cancel')));
  }

  //Delete User Account
  void deleteUserAccount() async {
    try {
      AFullScreenLoader.openLoadingDialog('Processing');

      /// First Re-Authenticate User
      final authRepository = AuthenticationRepository.instance;
      final provider = authRepository.currentUser!.providerData
          .map((e) => e.providerId)
          .first;
      if (provider.isNotEmpty) {
        if (provider == 'password') {
          AFullScreenLoader.stopLoading();
          Get.to(() => ReAuthenticationUserForm());
        }
      }
    } catch (e) {
      AFullScreenLoader.stopLoading();
      ASnackBarHelpers.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  //reauthentication user with email and password
  Future<void> reAuthenticateUser() async {
    try {
      //start loading
      AFullScreenLoader.openLoadingDialog('Processing...');

      //check internet connection
      bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AFullScreenLoader.stopLoading();
        return;
      }

//validation
      if (!reAuthFormKey.currentState!.validate()) {
        AFullScreenLoader.stopLoading();
        return;
      }

//reauthenticate user with email and password
      await AuthenticationRepository.instance
          .reAuthenticateUserWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //delete account
      await AuthenticationRepository.instance.deleteAccount();

//stop loading
      AFullScreenLoader.stopLoading();

      //redirect
      Get.offAll(() => LoginScreen());
    } catch (e) {
      //stop loading
      AFullScreenLoader.stopLoading();

      ASnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    }
  }

  Future<void> updateUserProfilePicture() async {
    try {
      //pick image
      XFile? image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxWidth: 512,
          maxHeight: 512);
      if (image == null) {
        return;
      }

      //upload profile picture in cloudinary

      dio.Response response = await _userRepository.uploadImage(image);

      if (response.statusCode == 200) {

        //get data
        final data = response.data;
        final imageUrl = data['url'];
        final publicId = data['public_id'];

        //update profile picture from fire store
        await _userRepository.updateSingleField({'profilePicture': imageUrl, 'publicId': publicId});

        //update profile picture from rx user
        user.value.profilePicture = imageUrl;
        user.value.publicId = publicId;
        user.refresh();

        //success message
        ASnackBarHelpers.successSnackBar(title: 'Congratulation', message: 'Profile picture updated successfully');

      } else {
        throw 'Upload Failed: Status ${response.statusCode}, Response: ${response.data}';
      }
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(title: 'Failed!', message: e.toString());
    }
  }
}
