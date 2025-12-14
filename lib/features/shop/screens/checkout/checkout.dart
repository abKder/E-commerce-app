import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/custom_shapes/clipper/rounded_container.dart';
import 'package:e_commerce/common/widgets/textfields/promo_code.dart';
import 'package:e_commerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:e_commerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/features/shop/controllers/cart/cart_controller.dart';
import 'package:e_commerce/features/shop/controllers/order/order_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final orderController = Get.put(OrderController());
    final subTotal = cartController.totalCartPrice.value;
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
              SizedBox(height: ASizes.spaceBtwSections),

              //billing section
              ARoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(ASizes.md),
                child: Column(
                  children: [
                    //amount section
                    ABillingAmountSection(),
                    SizedBox(height: ASizes.spaceBtwItems),

                    //payment section
                    ABillingPaymentSection(),

                    //address section
                    ABillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      //bottom navigation
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(ASizes.defaultSpace),
        child: Obx(
          () => SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => orderController.processOrder(
                    cartController.totalCartPrice.value), // Call processOrder
                child: Text(
                    'Checkout \$${cartController.totalCartPrice.value}')), // Display totalAmount
          ),
        ),
      ),
    );
  }
}
