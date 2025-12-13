import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/features/shop/screens/cart/cart.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ABottomAddToCart extends StatelessWidget {
  const ABottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = AHelperFunctions.inDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ASizes.defaultSpace, vertical: ASizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? AColors.darkerGrey : AColors.light,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(ASizes.cardRadiusLg),
            topRight: Radius.circular(ASizes.cardRadiusLg),
          )),
      child: Row(
        children: [
          //minus button
          ACircularIcon(
              icon: Iconsax.minus,
              backgroundColor: AColors.darkGrey,
              width: 40,
              height: 40,
              color: AColors.white),
          SizedBox(width: ASizes.spaceBtwItems),

          //counter value
          Text('1', style: Theme.of(context).textTheme.titleSmall),
          SizedBox(width: ASizes.spaceBtwItems),

          // plus button
          ACircularIcon(
              icon: Iconsax.add,
              backgroundColor: AColors.black,
              width: 40,
              height: 40,
              color: AColors.white),
          Spacer(),

          // add to cart button
          ElevatedButton(
            onPressed: () => Get.to(() =>CartScreen()),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(ASizes.md),
              backgroundColor: AColors.black,
              foregroundColor: AColors.white, // optional
              side: BorderSide(color: AColors.black), // FIXED
            ),
            child: Row(
              children: [
                Icon(Iconsax.shopping_bag),
                SizedBox(width: ASizes.spaceBtwItems / 2),
                Text('Add To Cart'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
