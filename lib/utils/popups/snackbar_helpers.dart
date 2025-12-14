import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../constants/colors.dart';
import '../helpers/helper_function.dart';

class ASnackBarHelpers {
  static customToast({required message}) {
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
      borderRadius: 30,
      margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
      backgroundColor: AHelperFunctions.inDarkMode(Get.context!)
          ? AColors.darkerGrey.withOpacity(0.9)
          : AColors.grey.withOpacity(0.9),
      duration: const Duration(seconds: 3),
      snackPosition: SnackPosition.BOTTOM,
      isDismissible: true,
      shouldIconPulse: true,
    );
  }

  /// Warning Orange Snack bar
  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: AColors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: AColors.white));
  }

  /// Success Green Snack bar
  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: AColors.white,
        backgroundColor: AColors.primary,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(10),
        icon: const Icon(Iconsax.check, color: AColors.white));
  }

  /// Error Red Snack bar
  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: AColors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(Iconsax.warning_2, color: AColors.white));
  }
}
