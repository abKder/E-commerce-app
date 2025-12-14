import 'package:e_commerce/features/shop/controllers/all_products/all_products_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../layouts/grid_layout.dart';

class ASortableProducts extends StatelessWidget {
  const ASortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    // Initialize controller and assign products
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);

    return Column(
      children: [
        //filter field
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          value: controller.selectedSortOption.value,
          onChanged: (value) => controller.sortProducts(value.toString()),
          items: ['Name', 'Lower Price', 'Higher Price', 'Sale', 'Newest'].map(
            (filter) {
              return DropdownMenuItem(value: filter, child: Text(filter));
            },
          ).toList(),
        ),
        SizedBox(height: ASizes.spaceBtwSections),

        //product
        Obx(
          () => controller.products.isEmpty
              ? const Center(child: Text("No Products Found"))
              : AGridLayout(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) => AProductCardVertical(
                      product: controller.products[index])),
        )
      ],
    );
  }
}
