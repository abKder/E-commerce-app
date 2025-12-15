import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/custom_shapes/clipper/rounded_container.dart';
import '../../../../../utils/constants/sizes.dart';

class ASingleAddress extends StatelessWidget {
  const ASingleAddress({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    bool dark = AHelperFunctions.inDarkMode(context);
    return ARoundedContainer(
      width: double.infinity,
      showBorder: true,
      backgroundColor: isSelected
          ? AColors.primary.withValues(alpha: 0.5)
          : Colors.transparent,
      borderColor: isSelected
          ? Colors.transparent
          : dark
              ? AColors.darkerGrey
              : AColors.grey,
      padding: EdgeInsets.all(ASizes.md),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mosfaka Ikfat Zannata',
                  style: Theme.of(context).textTheme.titleLarge,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
              SizedBox(height: ASizes.spaceBtwItems / 2),
              Text('01555548885', maxLines: 1, overflow: TextOverflow.ellipsis),
              SizedBox(height: ASizes.spaceBtwItems / 2),
              Text('House No.153, Dhaka, Mirpur-2, Block.CH'),
            ],
          ),
          if (isSelected)
            Positioned(
              top: 0,
              bottom: 0,
              right: 6,
              child: Icon(Iconsax.tick_circle5),
            )
        ],
      ),
    );
  }
}
