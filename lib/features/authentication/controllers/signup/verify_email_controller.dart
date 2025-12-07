import 'dart:async';
import 'package:e_commerce/common/widgets/screens/success_screen.dart';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  //send email verification link to current user
  Future<void> sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      ASnackBarHelpers.successSnackBar(
          title: 'Email Sent',
          message: 'Please check your inbox and verify your email');
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  //timer to automatically redirect on email verification
  void setTimerForAutoRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            title: ATexts.accountCreatedTitle,
            subTitle: ATexts.accountCreatedSubTitle,
            image: AImages.successfulPaymentIcon,
            onTap: () => AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  //manually check email is verified
  Future<void> checkEmailVerificationStatus() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null && currentUser.emailVerified) {
        Get.off(() => SuccessScreen(
            title: ATexts.accountCreatedTitle,
            subTitle: ATexts.accountCreatedSubTitle,
            image: AImages.successfulPaymentIcon,
            onTap: () => AuthenticationRepository.instance.screenRedirect()));
      }
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
