import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/admin/controllers/brand/admin_brand_controller.dart';
import 'package:e_commerce/features/admin/screens/brands/create_brand_screen.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AdminBrandsScreen extends StatelessWidget {
  const AdminBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminBrandController());

    return Scaffold(
      appBar: AAppBar(
        title: Text('Manage Brands',
            style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
        actions: [
          IconButton(
              onPressed: () => Get.to(() => const CreateBrandScreen()),
              icon: const Icon(Icons.add))
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.brands.isEmpty) {
          return const Center(child: Text('No Brands Found'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          itemCount: controller.brands.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: ASizes.spaceBtwItems),
          itemBuilder: (_, index) {
            final brand = controller.brands[index];
            return Container(
              padding: const EdgeInsets.all(ASizes.md),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ASizes.cardRadiusLg),
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  // Image Placeholder
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: AColors.white,
                        borderRadius: BorderRadius.circular(100),
                        border:
                            Border.all(color: Colors.grey.withOpacity(0.2))),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: brand.image.isNotEmpty
                            ? Image.network(brand.image,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) =>
                                    const Icon(Iconsax.image))
                            : const Icon(Iconsax.image, color: Colors.black)),
                  ),
                  const SizedBox(width: ASizes.spaceBtwItems),

                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(brand.name,
                          style: Theme.of(context).textTheme.titleLarge),
                      Text(brand.isFeatured == true ? 'Featured' : 'Standard',
                          style: Theme.of(context).textTheme.labelMedium),
                    ],
                  )),

                  // Edit
                  IconButton(
                      onPressed: () =>
                          Get.to(() => CreateBrandScreen(brand: brand)),
                      icon: const Icon(Icons.edit, color: Colors.blue)),

                  // Delete
                  IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                            title: 'Delete Brand',
                            middleText: 'Are you sure?',
                            onConfirm: () async {
                              await controller.deleteBrand(brand.id);
                              Get.back();
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
