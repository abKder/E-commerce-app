import 'package:e_commerce/common/widgets/custom_shapes/clipper/rounded_container.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/common/widgets/texts/product_title_text.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class AProductAttributes extends StatelessWidget {
  const AProductAttributes({super.key, required this.product});

  final ProductModel product;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title price and stock
              Row(
                children: [
                  // variation heading
                  ASectionHeading(title: 'Variation', showActionButton: false),
                  SizedBox(width: ASizes.spaceBtwItems),

                  Column(
                    children: [
                      Row(
                        children: [
                          // price
                          AProductTitleText(title: 'Price: ', smallSize: true),

                          //actual price
                          Text(product.price.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough)),
                          SizedBox(width: ASizes.spaceBtwItems),

                          //discount sale price
                          AProductPriceText(price: product.price.toString()),
                        ],
                      ),

                      // stock status
                      Row(
                        children: [
                          AProductTitleText(title: 'Stock: ', smallSize: true),
                          Text(product.stock.toString(),
                              style: Theme.of(context).textTheme.titleMedium)
                        ],
                      )
                    ],
                  )
                ],
              ),

              AProductTitleText(title: product.title ?? "", smallSize: true, maxLines: 4),
            ],
          ),
        ),
        SizedBox(height: ASizes.spaceBtwItems),

        //attribute colors
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ASectionHeading(title: 'Colors', showActionButton: false),
            SizedBox(height: ASizes.spaceBtwItems / 2),
            Wrap(
              spacing: ASizes.sm,
              children: [
                AChoiceChip(
                  text: "Red",
                  selected: true,
                  onSelected: (value) {},
                ),
                AChoiceChip(
                  text: "Blue",
                  selected: false,
                  onSelected: (value) {},
                ),
                AChoiceChip(
                  text: "Orange",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        ),
        SizedBox(height: ASizes.spaceBtwItems),

        //attribute size
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ASectionHeading(title: 'Sizes', showActionButton: false),
            SizedBox(height: ASizes.spaceBtwItems / 2),
            Wrap(
              spacing: ASizes.sm,
              children: [
                AChoiceChip(
                  text: "Small",
                  selected: true,
                  onSelected: (value) {},
                ),
                // SizedBox(width: ASizes.spaceBtwItems / 2),
                AChoiceChip(
                  text: "Medium",
                  selected: false,
                  onSelected: (value) {},
                ),
                // SizedBox(width: ASizes.spaceBtwItems / 2),
                AChoiceChip(
                  text: "Large",
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
