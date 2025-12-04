import 'package:e_commerce/common/widgets/custom_shapes/clipper/rounded_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AOrdersListItems extends StatelessWidget {
  const AOrdersListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: ASizes.spaceBtwItems),
      itemCount: 10,
      itemBuilder: (context, index) {
      return ARoundedContainer(
        showBorder: true,
        backgroundColor: dark ? AColors.dark : AColors.light,
        padding: EdgeInsets.all(ASizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [


            Row(
              children: [
                Icon(Iconsax.ship),
                SizedBox(width: ASizes.spaceBtwItems / 2),

                Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Processing', style: Theme.of(context).textTheme.bodyLarge!.apply(color: AColors.primary, fontWeightDelta: 1)),
                          Text('04 December 2025', style: Theme.of(context).textTheme.headlineSmall,)

                        ]
                    )),

                IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34, size: ASizes.iconSm))
              ],
            ),
            SizedBox(height: ASizes.spaceBtwItems),


            Row(
              children: [
                Expanded(child: Row(
                  children: [
                    Icon(Iconsax.tag),
                    SizedBox(width: ASizes.spaceBtwItems / 2),

                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order', style: Theme.of(context).textTheme.labelMedium),
                              Text('22235103365', style: Theme.of(context).textTheme.titleMedium)

                            ]
                        )),
                  ],
                )),

                Expanded(child: Row(
                  children: [
                    Icon(Iconsax.calendar),
                    SizedBox(width: ASizes.spaceBtwItems / 2),

                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium),
                              Text('04 December 2025', style: Theme.of(context).textTheme.titleMedium)

                            ]
                        )),
                  ],
                )),
              ],
            )
          ],
        ),
      );
    },);
  }
}
