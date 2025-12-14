import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/features/admin/screens/navigation/admin_navigation_menu.dart';
import 'package:e_commerce/utils/helpers/network_manager.dart';
import 'package:e_commerce/utils/popups/full_screen_loader.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  //variable
  final email = TextEditingController();
  final password = TextEditingController();
  RxBool isPasswordVisible = false.obs;
  RxBool rememberMe = false.obs;
  final loginFormKey = GlobalKey<FormState>();
  final localStorage = GetStorage();

  @override
  void onInit() {
    email.text = localStorage.read('Remember_email') ?? '';
    password.text = localStorage.read('Remember_password') ?? '';
    super.onInit();
  }

  Future<void> loginWithEmailAndPassword() async {
    try {
      //start loading
      AFullScreenLoader.openLoadingDialog('Logging you in....');

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        AFullScreenLoader.stopLoading();
        ASnackBarHelpers.warningSnackBar(title: 'No Internet Connection');
        return;
      }

      //form validation
      if (!loginFormKey.currentState!.validate()) {
        AFullScreenLoader.stopLoading();
        return;
      }

      //save data if remember me is checked
      if (rememberMe.value) {
        localStorage.write('Remember_email', email.text.trim());
        localStorage.write('Remember_password', password.text.trim());
      } else {
        localStorage.remove('Remember_email');
        localStorage.remove('Remember_password');
      }

      // Check for Admin Credentials
      if (email.text.trim() == 'superadmin@gmail.com' &&
          password.text.trim() == 'superadmin@gmail.com') {
        AFullScreenLoader.stopLoading();
        // Redirect to Admin Dashboard
        Get.offAll(() => const AdminNavigationMenu());
        return;
      }

      //login user with email and password
      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      //stop loading
      AFullScreenLoader.stopLoading();

      //redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      AFullScreenLoader.stopLoading();
      ASnackBarHelpers.errorSnackBar(
          title: 'Login Failed', message: e.toString());
    }
  }
}
