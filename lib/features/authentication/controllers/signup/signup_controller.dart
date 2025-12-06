import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/data/repositories/user/user_repository.dart';
import 'package:e_commerce/features/authentication/models/user_model.dart';
import 'package:e_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

//variables
  final signupFormKey = GlobalKey<FormState>();
  // final _authRepository = Get.put(AuthenticationRepository());
  RxBool isPasswordVisible = false.obs;
  RxBool privacyPolicy = false.obs;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  Future<void> registerUser() async {
    try {
      //start loading
      AFullScreenLoader.openLoadingDialog(
          'We are processing your information...');

      //check internet connection
      bool inConnected = await NetworkManager.instance.isConnected();
      if (!inConnected) {
        AFullScreenLoader.stopLoading();
        ASnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      //check privacy policy button
      if (!privacyPolicy.value) {
        AFullScreenLoader.stopLoading();
        Get.snackbar('Error', 'Please accept the privacy policy',
            messageText: Text(
                'In order to create account, you must have to read and accept thr privacy policy and terms of Use.'));
        return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        AFullScreenLoader.stopLoading();
        return;
      }

      //register user
      UserCredential userCredential = await AuthenticationRepository.instance.registerUser(
          email.text.trim(), password.text.trim());

      //create user model
      UserModel userModel = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text,
        lastName: lastName.text,
        username: '${firstName.text}${lastName.text}',
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: "",
      );

      //save user record
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(userModel);

      //success message
      ASnackBarHelpers.successSnackBar(title: 'Congratulation!', message: 'Your account has been created! Verify email to continue');

      //stop loading
      AFullScreenLoader.stopLoading();

      //verify email screen
      Get.to(() => VerifyEmailScreen());
    } catch (e) {
      //stop loading
      AFullScreenLoader.stopLoading();

      ASnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
