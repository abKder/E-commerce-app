import 'package:e_commerce/features/admin/screens/banners/admin_banners_screen.dart';
import 'package:e_commerce/features/admin/screens/brands/admin_brands_screen.dart';
import 'package:e_commerce/features/admin/screens/category/admin_categories_screen.dart';
import 'package:e_commerce/features/admin/screens/products/admin_products_screen.dart';
import 'package:e_commerce/features/shop/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          IconButton(
              onPressed: () => Get.to(() => const HomeScreen()),
              icon: const Icon(Icons.home)),
          IconButton(
              onPressed: () => AuthenticationRepository.instance.logout(),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Column(
            children: [
              _buildDashboardCard(
                context,
                title: 'Manage Products',
                icon: Icons.shopping_bag,
                onTap: () => Get.to(() => const AdminProductsScreen()),
              ),
              const SizedBox(height: ASizes.spaceBtwItems),
              _buildDashboardCard(
                context,
                title: 'Manage Categories',
                icon: Icons.category,
                onTap: () => Get.to(() => const AdminCategoriesScreen()),
              ),
              const SizedBox(height: ASizes.spaceBtwItems),
              _buildDashboardCard(
                context,
                title: 'Manage Brands',
                icon: Icons.branding_watermark,
                onTap: () => Get.to(() => const AdminBrandsScreen()),
              ),
              const SizedBox(height: ASizes.spaceBtwItems),
              _buildDashboardCard(
                context,
                title: 'Manage Banners',
                icon: Icons.image,
                onTap: () => Get.to(() => const AdminBannersScreen()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context,
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(ASizes.md),
        decoration: BoxDecoration(
          color: AColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(ASizes.cardRadiusLg),
          border: Border.all(color: AColors.primary),
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: AColors.primary),
            const SizedBox(width: ASizes.spaceBtwItems),
            Text(title, style: Theme.of(context).textTheme.titleLarge),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: AColors.darkGrey),
          ],
        ),
      ),
    );
  }
}
