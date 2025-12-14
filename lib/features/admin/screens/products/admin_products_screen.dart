import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/features/admin/controllers/product/admin_product_controller.dart';
import 'package:e_commerce/features/admin/screens/products/add_product_screen.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AdminProductsScreen extends StatelessWidget {
  const AdminProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminProductController());

    return Scaffold(
      appBar:
          const AAppBar(title: Text('Manage Products'), showBackArrow: true),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AColors.primary,
        onPressed: () => Get.to(() => const AdminAddProductScreen()),
        child: const Icon(Iconsax.add, color: AColors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Obx(
            () {
              if (controller.isLoading.value)
                return const Center(child: CircularProgressIndicator());

              if (controller.allProducts.isEmpty) {
                return const Center(child: Text('No Products Found!'));
              }

              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.allProducts.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: ASizes.spaceBtwItems),
                itemBuilder: (_, index) {
                  final product = controller.allProducts[index];
                  return Container(
                    padding: const EdgeInsets.all(ASizes.sm),
                    decoration: BoxDecoration(
                      color: AColors.white,
                      borderRadius: BorderRadius.circular(ASizes.cardRadiusLg),
                      border: Border.all(color: AColors.grey),
                    ),
                    child: Row(
                      children: [
                        // Thumbnail
                        ARoundedImage(
                          imageUrl: product.thumbnail,
                          isNetworkImage: product.thumbnail.isNotEmpty,
                          width: 50,
                          height: 50,
                          padding: const EdgeInsets.all(ASizes.xs),
                        ),
                        const SizedBox(width: ASizes.spaceBtwItems),

                        // Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(product.title,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                              Text(product.brand?.name ?? '',
                                  style: Theme.of(context).textTheme.bodySmall),
                              Text('\$${product.price}',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                        ),

                        // Actions
                        Row(
                          children: [
                            IconButton(
                                onPressed: () => Get.to(() =>
                                    AdminAddProductScreen(product: product)),
                                icon: const Icon(Iconsax.edit,
                                    color: AColors.primary)),
                            IconButton(
                                onPressed: () {
                                  // Show Confirmation Dialog
                                  Get.defaultDialog(
                                    title: 'Delete Product',
                                    middleText:
                                        'Are you sure you want to delete this product?',
                                    onConfirm: () {
                                      Get.back();
                                      controller.deleteProduct(product.id);
                                    },
                                    onCancel: () {},
                                  );
                                },
                                icon: const Icon(Iconsax.trash,
                                    color: AColors.error)),
                          ],
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
