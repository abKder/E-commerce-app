import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/features/shop/controllers/home/home_controller.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce/common/widgets/custom_shapes/clipper/primary_header_container.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/textfields/search_bar.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/helpers/helperFunction.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = AHelperFunctions.inDarkMode(context);
    final controller = Get.put(HomeController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //upper part start here
            Stack(
              children: [
                // height
                SizedBox(height: ASizes.homePrimaryHeaderHeight + 20),

                // header container
                APrimaryHeaderContainer(
                    height: ASizes.homePrimaryHeaderHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //appbar
                        AHomeAppBar(dark: dark),
                        SizedBox(height: ASizes.spaceBtwSections),

                        // home categories
                        AHomeCategories()
                      ],
                    )),

                //search bar
                ASearchBar(),
              ],
            ),

            //lower part start here

            Padding(
              padding: const EdgeInsets.all(ASizes.defaultSpace),
              child: Column(
                children: [
                  //banner
                  APromoSlider(
                    banners: [
                      AImages.banner1,
                      AImages.banner2,
                      AImages.banner3
                    ],
                  ),
                  const SizedBox(height: ASizes.spaceBtwSections),

                  //section heading
                  ASectionHeading(title: 'Popular Products', onPressed: () {}),
                  const SizedBox(height: ASizes.spaceBtwItems),

                  //vertical product card
                  AGridLayout(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return AProductCardVertical();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
