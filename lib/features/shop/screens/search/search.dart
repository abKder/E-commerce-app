import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final searchText = ''.obs;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          onChanged: (value) => searchText.value = value,
          decoration: const InputDecoration(
            hintText: 'Search products...',
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(ASizes.defaultSpace),
            child: Obx(
              () {
                final query = searchText.value.toLowerCase();
                if (query.isEmpty) {
                  return const Center(child: Text('Start typing to search...'));
                }

                final filteredProducts = controller.allProducts
                    .where((p) => p.title.toLowerCase().contains(query))
                    .toList();

                if (filteredProducts.isEmpty) {
                  return const Center(child: Text('No Products Found!'));
                }

                return AGridLayout(
                  itemCount: filteredProducts.length,
                  itemBuilder: (context, index) =>
                      AProductCardVertical(product: filteredProducts[index]),
                );
              },
            )),
      ),
    );
  }
}
