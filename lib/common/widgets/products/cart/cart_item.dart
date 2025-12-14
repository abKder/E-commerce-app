import 'package:e_commerce/features/shop/models/cart_item_model.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_function.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_with_verify_icon.dart';
import '../../texts/product_title_text.dart';

class ACartItem extends StatelessWidget {
  const ACartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    return Row(
      children: [
        //product image
        ARoundedImage(
            imageUrl: cartItem.image ?? '',
            height: 60.0,
            width: 60.0,
            isNetworkImage: true,
            padding: EdgeInsets.all(ASizes.sm),
            backgroundColor: dark ? AColors.darkerGrey : AColors.light),
        SizedBox(width: ASizes.spaceBtwItems),

        //brand name variation
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            //brand
            ABrandTitleWithVerifyIcon(title: cartItem.brandName ?? ''),

            //product title
            Flexible(
                child: AProductTitleText(title: cartItem.title, maxLines: 1)),

            //variation
            if (cartItem.selectedVariation != null)
              Text.rich(TextSpan(
                  children: cartItem.selectedVariation!.entries
                      .map((e) => TextSpan(children: [
                            TextSpan(
                                text: '${e.key} ',
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text: '${e.value} ',
                                style: Theme.of(context).textTheme.bodyLarge),
                          ]))
                      .toList()))
          ],
        ))
      ],
    );
  }
}
