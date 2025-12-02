import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/common/widgets/texts/product_price_text.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../common/widgets/products/cart/product_quantity_with_add_remove.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //appbar
      appBar: AAppBar(showBackArrow: true, title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium)),

      //body
      body: Padding(
        padding: APadding.screenPadding,
        child: ListView.separated(
          separatorBuilder: (context, index) =>
              SizedBox(height: ASizes.spaceBtwSections),
          itemCount: 7,
          itemBuilder: (context, index) {
            return Column(
              children: [

                //cart item
                ACartItem(),
                SizedBox(height: ASizes.spaceBtwItems),

                //price and counter button
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
          },),
      ),


      //bottom navigation
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(ASizes.defaultSpace),
        child: AElevatedButton( onPressed: (){},child: Text('Checkout  \$4900'),),
      ),


    );
  }
}



