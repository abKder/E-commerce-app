import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';

class AProductThumbnailAndSlider extends StatelessWidget {
  const AProductThumbnailAndSlider({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark ? AColors.darkerGrey : AColors.light,
      child: Stack(
        children: [
          //image thumbnail
          SizedBox(
              height: 400,
              child: Padding(
                  padding: EdgeInsets.all(ASizes.productImageRadius * 2),
                  child: Image(image: AssetImage(AImages.product1)))),

          // image slider
          Positioned(
              left: ASizes.defaultSpace,
              right: 0,
              bottom: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(width: ASizes.spaceBtwItems),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) => ARoundedImage(
                        width: 80,
                        backgroundColor:
                        dark ? AColors.dark : AColors.white,
                        padding: EdgeInsets.all(ASizes.sm),
                        border: Border.all(color: AColors.primary),
                        imageUrl: AImages.product1)),
              )),

          //appbar  back arrow and favourite button
          AAppBar(
            showBackArrow: true,
            actions: [
              ACircularIcon(icon: Iconsax.heart5, color: Colors.red)
            ],
          ),

        ],
      ),
    );
  }
}