import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helperFunction.dart';

class ACartCounterIcon extends StatelessWidget {
  const ACartCounterIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool dark = AHelperFunctions.inDarkMode(context);
    final controller = Get.put(CartController());

    return Stack(
      children: [
        /// Bag Icon | Cart Icon
        IconButton(
            onPressed: () => Get.to(() => CartScreen()),
            icon: const Icon(Iconsax.shopping_bag), color: AColors.light),

        /// Counter Text
        Positioned(
          right: 6.0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(color: dark ? AColors.dark : AColors.light, shape: BoxShape.circle),
            child: Center(
              child: Obx(
                    () => Text(
                  controller.noOfCartItems.value.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(fontSizeFactor: 0.8, color: dark ? AColors.light : AColors.dark),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}