import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';

class ABillingAmountSection extends StatelessWidget {
  const ABillingAmountSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium)),
            Text('\$2100', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: ASizes.spaceBtwItems / 2),

        Row(
          children: [
            Expanded(child: Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium)),
            Text('\$210', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        SizedBox(height: ASizes.spaceBtwItems / 2),

        Row(
          children: [
            Expanded(child: Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium)),
            Text('\$50', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: ASizes.spaceBtwItems / 2),


        Row(
          children: [
            Expanded(child: Text('Order Total', style: Theme.of(context).textTheme.bodyMedium)),
            Text('\$2360', style: Theme.of(context).textTheme.titleMedium),
          ],
        )
      ],
    );
  }
}