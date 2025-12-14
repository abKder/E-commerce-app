import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../icons/circular_icon.dart';

class AProductQuantityWithAddRemove extends StatelessWidget {
  const AProductQuantityWithAddRemove({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //minus button
        ACircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: ASizes.iconSm,
          color: dark ? AColors.white : AColors.black,
          backgroundColor: dark ? AColors.darkerGrey : AColors.light,
          onPressed: remove,
        ),
        SizedBox(width: ASizes.spaceBtwItems),

        Text(quantity.toString(),
            style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: ASizes.spaceBtwItems),

        //plus button
        ACircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: ASizes.iconSm,
          color: AColors.white,
          backgroundColor: AColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
