import 'package:e_commerce/common/widgets/custom_shapes/clipper/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/shop/screens/product_details/product_details.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadow.dart';
import '../../icons/circular_icon.dart';
import '../../texts/brand_title_with_verify_icon.dart';
import '../../texts/product_price_text.dart';
import '../../texts/product_title_text.dart';

class AProductCardVertical extends StatelessWidget {
  const AProductCardVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen()),
      child: Container(
        width: 350,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: AShadow.verticalProductShadow,
          borderRadius: BorderRadius.circular(ASizes.productImageRadius),
          color: dark ? AColors.darkerGrey : AColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //thumbnail favourite button and discount tag
            ARoundedContainer(
              height: 100,
              padding: const EdgeInsets.all(ASizes.sm),
              backgroundColor: dark ? AColors.dark : AColors.light,
              child: Stack(
                children: [
                  //thumbnail
                  Center(child: ARoundedImage(imageUrl: AImages.product1)),

                  //discount tag
                  Positioned(
                    top: 5,
                    child: ARoundedContainer(
                      radius: ASizes.sm,
                      backgroundColor: AColors.yellow.withValues(alpha: 0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: ASizes.sm, vertical: ASizes.xs),
                      child: Text('40%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: AColors.black)),
                    ),
                  ),

                  //favourite button
                  Positioned(
                      right: 0,
                      top: 0,
                      child: ACircularIcon(icon: Iconsax.heart5, color: Colors.red))
                ],
              ),
            ),
            SizedBox(height: ASizes.spaceBtwItems / 2),

            //details
            Padding(
              padding: const EdgeInsets.only(left: ASizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // product title
                  AProductTitleText(title: 'Apple Watch', smallSize: true),
                  SizedBox(height: ASizes.spaceBtwItems / 2),

                  //product brand
                  ABrandTitleWithVerifyIcon(title: 'Apple'),
                ],
              ),
            ),
            Spacer(),

            //product price and add button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //product price
                Padding(
                  padding: const EdgeInsets.only(left: ASizes.sm),
                  child: AProductPriceText(price: '150'),
                ),

                //add button
                Container(
                  width: ASizes.iconLg * 1.2,
                  height: ASizes.iconLg * 1.2,
                  decoration: BoxDecoration(
                      color: AColors.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(ASizes.cardRadiusMd),
                        bottomRight: Radius.circular(ASizes.productImageRadius),
                      )),
                  child: Icon(Iconsax.add, color: AColors.white),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
