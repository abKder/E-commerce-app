import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/admin/controllers/banner/admin_banner_controller.dart';
import 'package:e_commerce/features/admin/screens/banners/create_banner_screen.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AdminBannersScreen extends StatelessWidget {
  const AdminBannersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminBannerController());

    return Scaffold(
      appBar: AAppBar(
        title: Text('Manage Banners',
            style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
        actions: [
          IconButton(
              onPressed: () => Get.to(() => const CreateBannerScreen()),
              icon: const Icon(Icons.add))
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.banners.isEmpty) {
          return const Center(child: Text('No Banners Found'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          itemCount: controller.banners.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: ASizes.spaceBtwItems),
          itemBuilder: (_, index) {
            final banner = controller.banners[index];
            return Container(
              padding: const EdgeInsets.all(ASizes.md),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ASizes.cardRadiusLg),
                border: Border.all(color: Colors.grey.withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  // Image Placeholder
                  SizedBox(
                    height: 50,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(ASizes.sm),
                      child: banner.imageUrl.isNotEmpty
                          ? Image.network(banner.imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  const Icon(Iconsax.image))
                          : const Icon(Iconsax.image),
                    ),
                  ),
                  const SizedBox(width: ASizes.spaceBtwItems),

                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Target: ${banner.targetScreen}',
                          style: Theme.of(context).textTheme.titleMedium),
                      Text(banner.active ? 'Active' : 'Inactive',
                          style: Theme.of(context).textTheme.labelMedium?.apply(
                              color:
                                  banner.active ? Colors.green : Colors.grey)),
                    ],
                  )),

                  // Edit
                  IconButton(
                      onPressed: () =>
                          Get.to(() => CreateBannerScreen(banner: banner)),
                      icon: const Icon(Icons.edit, color: Colors.blue)),

                  // Delete
                  IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                            title: 'Delete Banner',
                            middleText: 'Are you sure?',
                            onConfirm: () async {
                              await controller.deleteBanner(banner.id);
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
