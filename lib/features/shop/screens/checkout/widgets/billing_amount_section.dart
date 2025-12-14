import 'package:e_commerce/features/shop/controllers/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/sizes.dart';

class ABillingAmountSection extends StatelessWidget {
  const ABillingAmountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Text('Subtotal',
                    style: Theme.of(context).textTheme.bodyMedium)),
            Obx(() => Text('\$${controller.totalCartPrice.value}',
                style: Theme.of(context).textTheme.bodyMedium)),
          ],
        ),
        SizedBox(height: ASizes.spaceBtwItems / 2),
        Row(
          children: [
            Expanded(
                child: Text('Shipping Fee',
                    style: Theme.of(context).textTheme.bodyMedium)),
            Obx(() => Text('\$${controller.shippingCost.value}',
                style: Theme.of(context).textTheme.labelLarge)),
          ],
        ),
        SizedBox(height: ASizes.spaceBtwItems / 2),
        Row(
          children: [
            Expanded(
                child: Text('Tax Fee',
                    style: Theme.of(context).textTheme.bodyMedium)),
            Obx(() => Text('\$${controller.taxAmount.value.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodyMedium)),
          ],
        ),
        SizedBox(height: ASizes.spaceBtwItems / 2),
        Row(
          children: [
            Expanded(
                child: Text('Order Total',
                    style: Theme.of(context).textTheme.bodyMedium)),
            Obx(() => Text(
                '\$${controller.grandTotal.value.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleMedium)),
          ],
        )
      ],
    );
  }
}
