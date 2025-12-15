import 'package:e_commerce/features/admin/screens/dashboard/admin_dashboard.dart';
import 'package:e_commerce/features/admin/screens/products/admin_products_screen.dart';
import 'package:e_commerce/features/admin/screens/order/admin_order_screen.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AdminNavigationMenu extends StatelessWidget {
  const AdminNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminNavigationController());
    final dark = AHelperFunctions.inDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: dark ? AColors.black : AColors.white,
          indicatorColor: dark
              ? AColors.white.withOpacity(0.1)
              : AColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Dashboard'),
            NavigationDestination(icon: Icon(Iconsax.box), label: 'Products'),
            NavigationDestination(icon: Icon(Iconsax.receipt), label: 'Orders'),
            // NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class AdminNavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const AdminDashboardScreen(),
    const AdminProductsScreen(),
    const AdminOrderScreen(),
    // const ProfileScreen(),
  ];
}
