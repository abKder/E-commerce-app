import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/products/sortable_products.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AAppBar(showBackArrow: true, title: Text('Popular Products', style: Theme.of(context).textTheme.headlineMedium)),


      body: SingleChildScrollView(
        child: Padding(
          padding: APadding.screenPadding,
          child: ASortableProducts(),

        ),
      ),
    );
  }
}
