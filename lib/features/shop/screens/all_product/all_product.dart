import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AAppBar(showBackArrow: true, title: Text('Popular Products', style: Theme.of(context).textTheme.headlineMedium)),


      body: SingleChildScrollView(
        child: Padding(
          padding: APadding.screenPadding,
          child: Column(
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
          ),




        ),
      ),
    );
  }
}
