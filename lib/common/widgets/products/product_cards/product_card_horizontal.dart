import 'package:e_commerce/common/widgets/texts/brand_title_with_verify_icon.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../custom_shapes/clipper/rounded_container.dart';
import '../../icons/circular_icon.dart';
import '../../images/rounded_image.dart';

class AProductCardHorizontal extends StatelessWidget {
  const AProductCardHorizontal({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ASizes.productImageRadius),
          color: dark ? AColors.darkerGrey : AColors.white
      ),

      child: Row(
        children: [
          //left portion
          ARoundedContainer(
            height: 120,
            padding: EdgeInsets.all(ASizes.sm),
            backgroundColor: dark ? AColors.dark : AColors.light,
            child: Stack(
              children: [
                //thumbnail
                SizedBox(
                    width: 120,
                    height: 120,
                    child: ARoundedImage(imageUrl: AImages.F_food_mango)),


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

          //right portion
          SizedBox(
            width: 170.0,

            child: Padding(
              padding: const EdgeInsets.only(left: ASizes.sm, top: ASizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      AProductTitleText(title: 'Yellow Mango', smallSize: true),
                      SizedBox(height: ASizes.spaceBtwItems / 2),

                      ABrandTitleWithVerifyIcon(title: 'Mango'),

                    ],
                  ),
                  Spacer(),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: AProductPriceText(price: '120')),

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
          )
        ],
      ),
    );
  }
}