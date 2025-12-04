import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/products/product_cards/product_card_horizontal.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = AHelperFunctions.inDarkMode(context);
    return Scaffold(
      appBar: AAppBar(
          showBackArrow: true,
          title:
              Text('Food', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: APadding.screenPadding,
          child: Column(
            children: [
              //sub category
              ASectionHeading(title: 'Food', onPressed: () {}),
              SizedBox(height: ASizes.spaceBtwItems / 2),

              //horizontal product card
              SizedBox(
                  height: 120,
                  child: ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (context, index) => SizedBox(width: ASizes.spaceBtwItems / 2),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return AProductCardHorizontal();
                      })),


              //sub category
              ASectionHeading(title: 'Food', onPressed: () {}),
              SizedBox(height: ASizes.spaceBtwItems / 2),

              //horizontal product card
              SizedBox(
                  height: 120,
                  child: ListView.separated(
                      itemCount: 5,
                      separatorBuilder: (context, index) => SizedBox(width: ASizes.spaceBtwItems / 2),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return AProductCardHorizontal();
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
