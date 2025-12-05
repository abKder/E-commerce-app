import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../layouts/grid_layout.dart';

class ASortableProducts extends StatelessWidget {
  const ASortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        //filter field
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value){},
          items: ['Name', 'Lower Price', 'Higher Price', 'Sale', 'Newest'].map((filter) {
            return DropdownMenuItem(value: filter, child: Text(filter));
          },).toList(),
        ),
        SizedBox(height: ASizes.spaceBtwSections),

        //product
        AGridLayout(itemCount: 10, itemBuilder:(context, index) => AProductCardVertical()),
      ],
    );
  }
}