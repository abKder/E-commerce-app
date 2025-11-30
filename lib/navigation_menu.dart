import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'features/personalization/screens/profile/profile.dart';
import 'features/shop/screens/home/home.dart';
import 'features/shop/screens/store/store.dart';
import 'features/shop/screens/wishlist/wishlist.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    bool dark = AHelperFunctions.inDarkMode(context);
    return Scaffold(

      body: Obx(() => controller.screens[controller.selectedIndex.value]),

      //navigation menu section start here
      bottomNavigationBar: Obx(
        () => NavigationBar(
            elevation: 0,
            backgroundColor: dark ? AColors.dark : AColors.light,
            indicatorColor: dark
                ? AColors.light.withValues(alpha: 0.1)
                : AColors.dark.withValues(alpha: 0.1),
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) {
              controller.selectedIndex.value = index;
            },
            destinations: [
              NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
              NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
              NavigationDestination(
                  icon: Icon(Iconsax.heart), label: "Wishlist"),
              NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
            ]),
      ),
    );
  }
}

class NavigationController extends GetxController {
  static NavigationController get instance => Get.find();
  RxInt selectedIndex = 0.obs;

 List<Widget> screens = [HomeScreen(), StoreScreen(), WishlistScreen(), ProfileScreen()];
}
