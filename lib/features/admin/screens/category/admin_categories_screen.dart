import 'package:e_commerce/common/widgets/appbar/appbar.dart';

import 'package:e_commerce/features/admin/controllers/category/admin_category_controller.dart';
import 'package:e_commerce/features/admin/screens/category/create_category_screen.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AdminCategoriesScreen extends StatelessWidget {
  const AdminCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminCategoryController());

    return Scaffold(
      appBar: AAppBar(
        title: Text('Manage Categories',
            style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
        actions: [
          IconButton(
              onPressed: () => Get.to(() => const CreateCategoryScreen()),
              icon: const Icon(Icons.add))
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.categories.isEmpty) {
          return const Center(child: Text('No Categories Found'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          itemCount: controller.categories.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: ASizes.spaceBtwItems),
          itemBuilder: (_, index) {
            final category = controller.categories[index];
            return Container(
              padding: const EdgeInsets.all(ASizes.md),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ASizes.cardRadiusLg),
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  // Icon/Image Placeholder
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: AColors.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(ASizes.md)),
                    // For now using icon until image handling is robust
                    child: const Icon(Iconsax.category, color: AColors.primary),
                  ),
                  const SizedBox(width: ASizes.spaceBtwItems),

                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(category.name,
                          style: Theme.of(context).textTheme.titleLarge),
                      Text(category.isFeatured ? 'Featured' : 'Standard',
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  )),

                  // Edit
                  IconButton(
                      onPressed: () => Get.to(
                          () => CreateCategoryScreen(category: category)),
                      icon: const Icon(Icons.edit, color: Colors.blue)),

                  // Delete
                  IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                            title: 'Delete Category',
                            middleText: 'Are you sure?',
                            onConfirm: () async {
                              await controller.deleteCategory(category.id);
                              Get.back(); // close dialog
                            },
                            onCancel: () => Get.back());
                      },
                      icon: const Icon(Icons.delete, color: Colors.red)),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
