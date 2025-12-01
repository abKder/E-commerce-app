import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/custom_shapes/clipper/rounded_container.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/texts/brand_title_with_verify_icon.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';

class AProductMetaData extends StatelessWidget {
  const AProductMetaData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //sale tag
        Row(
          children: [
            ARoundedContainer(
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
            SizedBox(width: ASizes.spaceBtwItems),

            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            SizedBox(width: ASizes.spaceBtwItems),

            //actual price
            AProductPriceText(price: '150', isLarge: true),
            Spacer(),

            //share button
            IconButton(onPressed: (){}, icon: Icon(Iconsax.share))
          ],
        ),
        SizedBox(height: ASizes.spaceBtwItems / 1.5),

        //product title
        AProductTitleText(title: 'Apple Watch'),
        SizedBox(height: ASizes.spaceBtwItems / 1.5),


        //product status
        Row(
          children: [
            AProductTitleText(title: 'Status'),
            SizedBox(width: ASizes.spaceBtwItems),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        SizedBox(height: ASizes.spaceBtwItems / 1.5),


        Row(
          children: [
            ACircularImage(
              padding: 0,
              image: AImages.apple, width: 32.0, height: 32.0,),
            SizedBox(width: ASizes.spaceBtwItems),
            ABrandTitleWithVerifyIcon(title: 'Apple'),
          ],
        )
      ],
    );
  }
}