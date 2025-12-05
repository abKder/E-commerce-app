import 'package:flutter/material.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/clipper/rounded_container.dart';
import '../images/rounded_image.dart';
import '../texts/brand_title_with_verify_icon.dart';

class ABrandCard extends StatelessWidget {
  const ABrandCard({
    super.key,
    this.showBorder = true,
    this.onTap,
  });

  final bool showBorder;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ARoundedContainer(
          width: ASizes.brandCardWidth,
          height: ASizes.brandCardHeight,
          showBorder: true,
          padding: EdgeInsets.all(ASizes.sm),
          backgroundColor: Colors.transparent,
          child: Row(
            children: [

              //brand image
              Flexible(child: ARoundedImage(imageUrl: AImages.apple, backgroundColor: Colors.transparent)),
              SizedBox(width: ASizes.spaceBtwItems / 2),

              //brand name and verify icon
              Expanded(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ABrandTitleWithVerifyIcon(title: 'Apple', brandTextSize: TextSizes.large),
                      Text('100 products', style: Theme.of(context).textTheme.labelMedium, overflow: TextOverflow.ellipsis)
                    ],
                  )),



            ],
          )
      ),
    );
  }
}