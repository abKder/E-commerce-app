import 'package:e_commerce/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/clipper/rounded_container.dart';
import 'brand_card.dart';

class ABrandShowcase extends StatelessWidget {
  const ABrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    return ARoundedContainer(
      showBorder: true,
      borderColor: AColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.all(ASizes.md),
      margin: EdgeInsets.only(bottom: ASizes.spaceBtwItems),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // brand with product count
          ABrandCard(showBorder: false),
          SizedBox(height: ASizes.spaceBtwItems / 2),

          //
          Row(
              children: images.map((image) => buildBrandImage(dark, image)).toList()
          )
        ],
      ),
    );
  }

  Widget buildBrandImage(bool dark, String image) {
    return Expanded(
        child: ARoundedContainer(
          height: 100,
          margin: const EdgeInsets.only(right: ASizes.sm),
          padding: const EdgeInsets.all(ASizes.md),
          backgroundColor: dark ? AColors.darkGrey : AColors.light,
          child: Image(image: AssetImage(image), fit: BoxFit.contain),
        ));
  }
}