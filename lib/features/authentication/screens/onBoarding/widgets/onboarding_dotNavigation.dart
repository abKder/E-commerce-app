import 'package:e_commerce/features/authentication/controllers/Onboarding/Onboarding_Controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../utils/helpers/device_helpers.dart';


class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return Positioned(
        bottom: ADeviceHelper.getBottomNavigationBarHeight()*5,
        right: ADeviceHelper.getScreenWidth(context)/3,
        left: ADeviceHelper.getScreenWidth(context)/3,
        child: SmoothPageIndicator(
          controller:controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count:3,
          effect: ExpandingDotsEffect(
            dotHeight: 9.0,
          ),
        ));
  }
}