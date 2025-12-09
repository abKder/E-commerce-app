import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/features/authentication/screens/forgot_password/reset_password.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //variable
  final email = TextEditingController();
  final forgetPasswordFormKey = GlobalKey<FormState>();

//send email to forget password

  Future<void> sendPasswordResetEmail() async {
    try {
      //start loading
      AFullScreenLoader.openLoadingDialog('Processing your request...');

      //check internet connection
      bool isConnection = await NetworkManager.instance.isConnected();
      if (!isConnection) {
        AFullScreenLoader.stopLoading();
        ASnackBarHelpers.warningSnackBar(title: 'No internet connection');
        return;
      }

      //form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        AFullScreenLoader.stopLoading();
        return;
      }

      //send email to reset password
      AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      //stop loading
      AFullScreenLoader.stopLoading();
      
      //success message
      ASnackBarHelpers.successSnackBar(title: 'Sent Email', message: 'Email link sent to reset your password');

      //redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      AFullScreenLoader.stopLoading();
      ASnackBarHelpers.errorSnackBar(title: 'Failed Forget Password', message: e.toString());
    }


  }




  Future<void> resendPasswordResetEmail() async {
    try {
      //start loading
      AFullScreenLoader.openLoadingDialog('Processing your request...');

      //check internet connection
      bool isConnection = await NetworkManager.instance.isConnected();
      if (!isConnection) {
        AFullScreenLoader.stopLoading();
        ASnackBarHelpers.warningSnackBar(title: 'No internet connection');
        return;
      }

      //send email to reset password
      AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());

      //stop loading
      AFullScreenLoader.stopLoading();

      //success message
      ASnackBarHelpers.successSnackBar(title: 'Sent Email', message: 'Email link sent to reset your password');

    } catch (e) {
      AFullScreenLoader.stopLoading();
      ASnackBarHelpers.errorSnackBar(title: 'Failed Forget Password', message: e.toString());
    }


  }
}
