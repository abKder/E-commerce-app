import 'package:e_commerce/common/widgets/custom_shapes/clipper/rounded_container.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';

class AProductAttributes extends StatelessWidget {
  const AProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    return Column(
      children: [

        //selected attributes price and description
        ARoundedContainer(
          padding: EdgeInsets.all(ASizes.md),
          backgroundColor: dark ? AColors.darkerGrey : AColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  ASectionHeading(title: 'Variation', showActionButton: false),
                  SizedBox(width: ASizes.spaceBtwItems),

                  Column(
                    children: [
                      Row(
                        children: [
                          AProductTitleText(title: 'Price', smallSize: true),

                          Text('250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
                          SizedBox(width: ASizes.spaceBtwItems),
                          AProductPriceText(price: '150'),
                        ],
                      ),

                      Row(
                        children: [
                          AProductTitleText(title: 'Stock', smallSize: true),
                          Text('In Stock', style: Theme.of(context).textTheme.titleMedium)
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ],

    );
  }
}
