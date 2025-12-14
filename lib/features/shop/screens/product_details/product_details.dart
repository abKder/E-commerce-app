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

import 'package:e_commerce/features/shop/models/product_model.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../checkout/checkout.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    return Scaffold(
      //body
      body: SingleChildScrollView(
        child: Column(
          children: [
            //product image and slider
            AProductThumbnailAndSlider(dark: dark, product: product),

            //Product details

            Padding(
              padding: APadding.screenPadding,
              child: Column(
                children: [
                  //price title Stock and brand
                  AProductMetaData(product: product),
                  SizedBox(height: ASizes.spaceBtwItems),

                  //attribute
                  AProductAttributes(product: product),
                  SizedBox(height: ASizes.spaceBtwSections),

                  //checkout button
                  AElevatedButton(
                      onPressed: () => Get.to(() => CheckoutScreen()),
                      child: Text('Checkout')),
                  SizedBox(height: ASizes.spaceBtwSections),

                  //description
                  ASectionHeading(
                      title: 'Description', showActionButton: false),
                  SizedBox(height: ASizes.spaceBtwItems),

                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(height: ASizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),

      //bottom navigation
      bottomNavigationBar: ABottomAddToCart(product: product),
    );
  }
}
