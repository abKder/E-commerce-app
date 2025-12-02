import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_with_verify_icon.dart';
import '../../texts/product_title_text.dart';

class ACartItem extends StatelessWidget {
  const ACartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    return Row(
      children: [

        //product image
        ARoundedImage(imageUrl: AImages.product1, height: 60.0, width: 60.0, padding: EdgeInsets.all(ASizes.sm), backgroundColor: dark ? AColors.darkerGrey : AColors.light),
        SizedBox(width: ASizes.spaceBtwItems),

        //brand name variation
        Expanded(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            //brand
            ABrandTitleWithVerifyIcon(title: 'Apple Watch'),

            //product title
            AProductTitleText(title: "Apple Watch with three variation", maxLines: 1),

            //variation
            RichText(text: TextSpan(children: [
              TextSpan(text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: 'Green ', style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(text: 'Storage ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: '2GB ', style: Theme.of(context).textTheme.bodyLarge),
            ]))
          ],
        ))

      ],
    );
  }
}