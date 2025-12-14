import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/icons/circular_icon.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/features/shop/controllers/product/favorites_controller.dart'; // Import FavoritesController
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import Get
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AAppBar(
        title:
            Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          ACircularIcon(
              icon: Iconsax.add,
              onPressed: () =>
                  NavigationController.instance.selectedIndex.value = 0)
        ],
      ),

      // body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Obx(
            () => FutureBuilder<List<ProductModel>>(
                future: FavoritesController.instance.getFavoriteProducts(),
                builder: (context, snapshot) {
                  const emptyWidget =
                      Center(child: Text('Whoops! Wishlist is Empty...'));

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (!snapshot.hasData ||
                      snapshot.data == null ||
                      snapshot.data!.isEmpty) {
                    return emptyWidget;
                  }

                  final products = snapshot.data!;
                  return AGridLayout(
                      itemCount: products.length,
                      itemBuilder: (context, index) =>
                          AProductCardVertical(product: products[index]));
                }),
          ),
        ),
      ),
    );
  }
}
