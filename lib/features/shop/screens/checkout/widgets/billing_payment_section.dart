import 'package:e_commerce/common/widgets/custom_shapes/clipper/rounded_container.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/helpers/helper_function.dart';

class ABillingPaymentSection extends StatelessWidget {
  const ABillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    return Column(
      children: [
        ASectionHeading(title: 'Payment Method', buttonTitle: 'Change', onPressed: () {}),
        SizedBox(height: ASizes.spaceBtwItems / 2),


        Row(
          children: [
            ARoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: dark ? AColors.light : AColors.white,
              padding: EdgeInsets.all(ASizes.sm),
              child: Image(image: AssetImage(AImages.googlePay), fit: BoxFit.contain),
            ),
            SizedBox(width: ASizes.spaceBtwItems / 2),

            Text('Google Pay', style: Theme.of(context).textTheme.bodyLarge)
          ],
        )


      ],
    );
  }
}
