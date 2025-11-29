import 'package:flutter/material.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/clipper/rounded_container.dart';
import '../images/rounded_image.dart';
import '../texts/brand_title_with_verify_icon.dart';

class ABrandCard extends StatelessWidget {
  const ABrandCard({
    super.key,
    this.showBorder = true,
    this.onTap,
    required this.brand
  });

  final bool showBorder;
  final VoidCallback? onTap;

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ARoundedContainer(
        height: ASizes.brandCardHeight,
        showBorder: showBorder,
        padding: EdgeInsets.all(ASizes.sm),
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// Brand Image
            Flexible(child: ARoundedImage(
              imageUrl: brand.image,
              isNetworkImage: true,
              backgroundColor: Colors.transparent,
            )),
            SizedBox(width: ASizes.spaceBtwItems / 2),

            /// Right Portion
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Brand Name & verify Icon
                  ABrandTitleWithVerifyIcon(title: brand.name, brandTextSize: TextSizes.large),

                  /// Text
                  Text('${brand.productsCount} products',
                      style: Theme.of(context).textTheme.labelMedium, overflow: TextOverflow.ellipsis)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}