import 'package:e_commerce/features/authentication/controllers/Onboarding/Onboarding_Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/elevated_button.dart';
import '../../../../../utils/constants/sizes.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
        left: 0,
        right: 0,
        bottom: ASizes.spaceBtwItems/2,
        child: AElevatedButton(
          onPressed: controller.nextPage,
          child: Obx(() => Text(controller.currentIndex.value == 2 ? 'Get Started' : 'Next'))

        )
    );
  }
}