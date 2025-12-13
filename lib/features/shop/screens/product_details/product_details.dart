import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/shop/screens/order/order.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_thumbnail_and_slider.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../checkout/checkout.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    return Scaffold(
      //body
      body: SingleChildScrollView(
        child: Column(
          children: [
            //product image and slider
            AProductThumbnailAndSlider(dark: dark),

            //Product details

           Padding(
             padding: APadding.screenPadding,
             child: Column(
               children: [
                 //price title Stock and brand
                 AProductMetaData(),
                 SizedBox(height: ASizes.spaceBtwItems),

                 //attribute
                 AProductAttributes(),
                 SizedBox(height: ASizes.spaceBtwSections),

                 //checkout button
                 AElevatedButton(onPressed: () => Get.to(() => CheckoutScreen()), child: Text('Checkout')),
                 SizedBox(height: ASizes.spaceBtwSections),

                 //description
                 ASectionHeading(title: 'Description', showActionButton: false),
                 SizedBox(height: ASizes.spaceBtwItems),


                 ReadMoreText(
                   'The Apple Watch is a premium smartwatch that keeps you connected, active, and healthy.It tracks workouts, steps, heart rate, sleep, and offers advanced sensors like ECG and SpO₂.You can receive calls, messages, and notifications right on your wrist.Its Retina display, smooth performance, and water resistance make it ideal for everyday use.With customizable faces and seamless iPhone integration, it becomes your perfect daily companion.',
                   trimLines: 2,
                   trimMode: TrimMode.Line,
                   trimCollapsedText: ' Show more',
                   trimExpandedText: ' Less',
                   moreStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
                   lessStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
                 ),
                 SizedBox(height: ASizes.spaceBtwSections),
               ],
             ),
           )

          ],
        ),
      ),

      //bottom navigation
      bottomNavigationBar: ABottomAddToCart(),
    );
  }
}


