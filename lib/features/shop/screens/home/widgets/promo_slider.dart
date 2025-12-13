import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce/features/shop/controllers/banner/banner_controller.dart';
import 'package:e_commerce/features/shop/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/sizes.dart';
import 'banners_dot_navigation.dart';

class APromoSlider extends StatelessWidget {
  const APromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HomeController.instance;
    final bannerController = Get.put(BannerController());
    return Obx(
        (){

          if(bannerController.isLoading.value){
            return CircularProgressIndicator();
          }

          if(bannerController.banners.isEmpty){
            return Text('Banners not found');
          }
          return Column(
            children: [

              //slider
              CarouselSlider(
                items: bannerController.banners.map((banner) => ARoundedImage(imageUrl: banner.imageUrl, isNetworkImage: true,)).toList(),
                options: CarouselOptions(viewportFraction: 1.0, onPageChanged: (index, reason) => controller.onPageChanged(index)),
                carouselController: controller.carouselController,
              ),
              SizedBox(height: ASizes.spaceBtwItems),

              BannerDotNavigation(),
            ],
          );
        }
    );
  }
}