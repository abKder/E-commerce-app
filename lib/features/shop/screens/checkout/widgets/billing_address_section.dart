import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ABillingAddressSection extends StatelessWidget {
  const ABillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ASectionHeading(title: 'Billing Address', buttonTitle: 'Change', onPressed: (){}),
        Text('Abdul Kader', style: Theme.of(context).textTheme.titleLarge),
        SizedBox(height: ASizes.spaceBtwItems / 2),

        Row(
          children: [
            Icon(Icons.phone, size: ASizes.iconSm, color: AColors.darkGrey),
            SizedBox(width: ASizes.spaceBtwItems),
            Text('01581030425')

          ],
        ),
        SizedBox(height: ASizes.spaceBtwItems / 2),

        Row(
          children: [
            Icon(Icons.location_history, size: ASizes.iconSm, color: AColors.darkGrey),
            SizedBox(width: ASizes.spaceBtwItems),
            Expanded(child: Text('House No.153, Dhaka, Mirpur-2, Block.CH', softWrap: true))

          ],
        ),
        // ASingleAddress(isSelected: false)


      ],

    );
  }
}
