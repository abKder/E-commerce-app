import 'package:e_commerce/features/shop/controllers/banner/banner_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../../../controllers/home/home_controller.dart';

class BannerDotNavigation extends StatelessWidget {
  const BannerDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    final bannerController = Get.put(BannerController());
    return Obx(
      () =>  SmoothPageIndicator(
        count: bannerController.banners.length,
        effect: ExpandingDotsEffect(
          dotHeight: 6.0,
        ), controller: PageController(initialPage: controller.currentIndex.value),
      ),
    );
  }
}