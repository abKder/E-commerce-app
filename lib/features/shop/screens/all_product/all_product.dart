import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/products/sortable_products.dart';

import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:get/get.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return Scaffold(
      appBar: AAppBar(
          showBackArrow: true,
          title: Text('All Products',
              style: Theme.of(context).textTheme.headlineMedium)),
      body: SingleChildScrollView(
        child: Padding(
          padding: APadding.screenPadding,
          child: Obx(() =>
              ASortableProducts(products: controller.allProducts.toList())),
        ),
      ),
    );
  }
}
