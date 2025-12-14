import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/features/shop/controllers/cart/cart_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ABottomAddToCart extends StatelessWidget {
  const ABottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = AHelperFunctions.inDarkMode(context);

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ASizes.defaultSpace, vertical: ASizes.defaultSpace / 2),
      decoration: BoxDecoration(
          color: dark ? AColors.darkerGrey : AColors.light,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(ASizes.cardRadiusLg),
            topRight: Radius.circular(ASizes.cardRadiusLg),
          )),
      child: Obx(
        () => Row(
          children: [
            //minus button
            ACircularIcon(
              icon: Iconsax.minus,
              backgroundColor: AColors.darkGrey,
              width: 40,
              height: 40,
              color: AColors.white,
              onPressed: () => controller.productQuantityInCart.value < 1
                  ? null
                  : controller.productQuantityInCart.value -= 1,
            ),
            SizedBox(width: ASizes.spaceBtwItems),

            //counter value
            Text(controller.productQuantityInCart.value.toString(),
                style: Theme.of(context).textTheme.titleSmall),
            SizedBox(width: ASizes.spaceBtwItems),

            // plus button
            ACircularIcon(
              icon: Iconsax.add,
              backgroundColor: AColors.black,
              width: 40,
              height: 40,
              color: AColors.white,
              onPressed: () => controller.productQuantityInCart.value += 1,
            ),
            Spacer(),

            // add to cart button
            ElevatedButton(
              onPressed: (controller.productQuantityInCart.value < 1
                  ? null
                  : () => controller.addToCart(product)
                  

                  ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(ASizes.md),
                backgroundColor: AColors.black,
                foregroundColor: AColors.white,
                side: BorderSide(color: AColors.black),
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
      ),
    );
  }
}
