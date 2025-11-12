import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../../utils/helpers/device_helpers.dart';
import '../../../controllers/Onboarding/Onboarding_Controller.dart';

class OnBoarding_SkipButton extends StatelessWidget {
  const OnBoarding_SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Obx(
        () => controller.currentIndex.value == 2 ? SizedBox() : Positioned(
        top: ADeviceHelper.getAppBarHeight(),
        right: 0,
        child: TextButton(onPressed: controller.skipPage, child: Text('Skip')))
    );
  }
}