import 'package:flutter/material.dart';
import '../../../../../common/widgets/brands/brand_showcase.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/images.dart';
import '../../../../../utils/constants/sizes.dart';

class ACategoryTab extends StatelessWidget {
  const ACategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          // padding: const EdgeInsets.(horizontal: ASizes.defaultSpace),
          child: Column(
            children: [
              //brand showcase section 1
              ABrandShowcase(images: [
                AImages.product1,
                AImages.product1,
                AImages.product1
              ]),
              //brand showcase section 2
              ABrandShowcase(images: [
                AImages.product1,
                AImages.product1,
                AImages.product1
              ]),
              SizedBox(height: ASizes.spaceBtwItems),

              //you might like section start here
              ASectionHeading(
                title: 'You might like',
                onPressed: () {},
              ),

              //grid product layout
              AGridLayout(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return AProductCardVertical();
                }),
              SizedBox(height: ASizes.spaceBtwItems)
            ],
          ),
        )
      ],
    );
  }
}
