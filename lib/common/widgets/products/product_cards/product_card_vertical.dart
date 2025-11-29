import 'package:e_commerce/common/widgets/custom_shapes/clipper/rounded_container.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/helpers/helperFunction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../styles/shadow.dart';

class AProductCardVertical extends StatelessWidget {
  const AProductCardVertical({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: AShadow.verticalProductShadow,
        borderRadius: BorderRadius.circular(ASizes.productImageRadius),
        color: dark ? AColors.darkerGrey : AColors.white,
      ),
      child: Column(
        children: [
          //thumbnail favourite button and discount tag
          ARoundedContainer(
            width: 180,
            padding: const EdgeInsets.all(ASizes.sm),
            backgroundColor: dark ? AColors.dark : AColors.light,
            child: Stack(
              children: [
                //thumbnail
                ARoundedImage(imageUrl: AImages.product1),

                //discount tag
                Positioned(
                  top: 12.0,
                    child: ARoundedContainer(
                  radius: ASizes.sm,
                  backgroundColor: AColors.yellow.withValues(alpha: 0.8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: ASizes.sm, vertical: ASizes.xs),
                  child: Text('20%',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: AColors.black)),
                ),
                ),

                //favourite button

                IconButton(onPressed: (){}, icon:  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
