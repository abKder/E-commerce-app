import 'package:e_commerce/features/shop/controllers/product/product_controller.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';

class ACategoryTab extends StatelessWidget {
  const ACategoryTab({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final products = controller.getProductsByCategory(category.id);

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Column(
            children: [
              //brand showcase section 1
              // Note: Brand showcase logic would need BrandController/Relation.
              // Keeping hardcoded or hiding for now.
              /*
              ABrandShowcase(images: [
                AImages.product1,
                AImages.product1,
                AImages.product1
              ]),
              */
              SizedBox(height: ASizes.spaceBtwItems),

              //you might like section start here
              ASectionHeading(
                title: 'You might like',
                onPressed: () {},
              ),
              const SizedBox(height: ASizes.spaceBtwItems),

              //grid product layout
              if (products.isEmpty)
                const Center(child: Text("No products in this category")),
              if (products.isNotEmpty)
                AGridLayout(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return AProductCardVertical(product: products[index]);
                    }),
              SizedBox(height: ASizes.spaceBtwItems)
            ],
          ),
        )
      ],
    );
  }
}
