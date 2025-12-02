import 'package:flutter/material.dart';
import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/products/cart/product_quantity_with_add_remove.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class ACartItems extends StatelessWidget {
  const ACartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) =>
          SizedBox(height: ASizes.spaceBtwSections),
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          children: [
            //cart item
            ACartItem(),
           if(showAddRemoveButtons) SizedBox(height: ASizes.spaceBtwItems),

            //price and counter button
            if (showAddRemoveButtons)
              Row(
                children: [
                  SizedBox(width: 70.0),

                  //quantity button
                  AProductQuantityWithAddRemove(),
                  Spacer(),

                  //product price
                  AProductPriceText(price: '700')
                ],
              )
          ],
        );
      },
    );
  }
}
