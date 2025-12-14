import 'package:e_commerce/features/shop/controllers/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    final controller = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (context, index) =>
            SizedBox(height: ASizes.spaceBtwSections),
        itemCount: controller.cartItems.length,
        itemBuilder: (context, index) {
          final item = controller.cartItems[index];

          return Column(
            children: [
              //cart item
              ACartItem(cartItem: item),
              if (showAddRemoveButtons) SizedBox(height: ASizes.spaceBtwItems),

              //price and counter button
              if (showAddRemoveButtons)
                Row(
                  children: [
                    SizedBox(width: 70.0),

                    //quantity button
                    AProductQuantityWithAddRemove(
                      quantity: item.quantity,
                      add: () => controller.addOneToCart(item),
                      remove: () => controller.removeOneFromCart(item),
                    ),
                    Spacer(),

                    //product price
                    AProductPriceText(
                        price: (item.price * item.quantity).toStringAsFixed(1))
                  ],
                )
            ],
          );
        },
      ),
    );
  }
}
