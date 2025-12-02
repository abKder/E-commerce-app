import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/clipper/rounded_container.dart';
import 'package:e_commerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/textfields/promo_code.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AAppBar(
          showBackArrow: true,
          title: Text('Order Review',
              style: Theme.of(context).textTheme.headlineMedium)),

      //body

      body: SingleChildScrollView(
        child: Padding(
          padding: APadding.screenPadding,
          child: Column(
            children: [
              //items
              ACartItems(showAddRemoveButtons: false),
              SizedBox(height: ASizes.spaceBtwSections),

              //promo code
              APromoCodeField(),


              //billing section
              ARoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(ASizes.md),
                child: Column(
                  children: [

                    //amount

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
