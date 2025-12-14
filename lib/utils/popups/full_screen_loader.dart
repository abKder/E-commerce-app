import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/loaders/animation_loader.dart';
import '../constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';

class AFullScreenLoader {
  static void openLoadingDialog(String text, {String? animation}) {
    print('AFullScreenLoader: Open Dialog');
    showDialog(
        context: Get.overlayContext!,
        barrierDismissible: false,
        builder: (_) => PopScope(
            canPop: false,
            child: Container(
              color: AHelperFunctions.inDarkMode(Get.context!)
                  ? AColors.dark
                  : AColors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  /// Extra Space
                  SizedBox(height: 250),

                  /// Animation
                  AAnimationLoader(
                      text: text,
                      animation: animation ?? AImages.loadingAnimation)
                ],
              ),
            )));
  }

  static void stopLoading() {
    print('AFullScreenLoader: Stop Loading');
    Navigator.of(Get.overlayContext!).pop();
  }
}
