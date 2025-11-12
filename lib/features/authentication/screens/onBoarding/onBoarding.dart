import 'package:e_commerce/features/authentication/controllers/Onboarding/Onboarding_Controller.dart';
import 'package:e_commerce/features/authentication/screens/onBoarding/widgets/onboarding_dotNavigation.dart';
import 'package:e_commerce/features/authentication/screens/onBoarding/widgets/OnBoarding_Next.dart';
import 'package:e_commerce/features/authentication/screens/onBoarding/widgets/OnBoarding_Skip.dart';
import 'package:e_commerce/features/authentication/screens/onBoarding/widgets/onBoarding_Page.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoardingScreen extends StatelessWidget{
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context){
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: ASizes.defaultSpace),
        child: Stack(
        children: [
          
          // scrollable page start here
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(animation: AImages.onBoardingAnimation1, title: ATexts.onBoardingTitle1, subTitle: ATexts.onBoardingSubTitle1,),
              OnBoardingPage(animation: AImages.onBoardingAnimation2, title: ATexts.onBoardingTitle2, subTitle: ATexts.onBoardingSubTitle2,),
              OnBoardingPage(animation: AImages.onBoardingAnimation3, title: ATexts.onBoardingTitle3, subTitle: ATexts.onBoardingSubTitle3,)
            ],
          ),
          // scrollable page end here
          
          // indicator start here
          OnBoardingDotNavigation(),
          // indicator end here

          // button bottom side start here
          OnBoardingNextButton(),
          // button bottom side end here

          // skip button start here
          OnBoarding_SkipButton(),
          // skip button end here
          
        ],
        ))
    );
  }
}