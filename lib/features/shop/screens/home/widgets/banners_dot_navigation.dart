import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../../../controllers/home/home_controller.dart';

class BannerDotNavigation extends StatelessWidget {
  const BannerDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    return Obx(
      () =>  SmoothPageIndicator(
        count: 3,
        effect: ExpandingDotsEffect(
          dotHeight: 6.0,
        ), controller: PageController(initialPage: controller.currentIndex.value),
      ),
    );
  }
}