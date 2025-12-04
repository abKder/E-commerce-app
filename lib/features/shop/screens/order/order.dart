import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/shop/screens/order/widgets/orders_list.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AAppBar(showBackArrow: true, title: Text('My Orders', style: Theme.of(context).textTheme.headlineMedium)),


      body: Padding(
          padding: APadding.screenPadding,
        child: AOrdersListItems(),
      ),

    );
  }
}
