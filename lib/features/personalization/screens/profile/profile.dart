import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/profile_primary_header.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/setting_menu_tile.dart';
import 'package:e_commerce/features/personalization/screens/profile/widgets/user_profile_tile.dart';
import 'package:e_commerce/features/shop/screens/cart/cart.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../shop/screens/order/order.dart';
import '../address/address.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AProfilePrimaryHeader(),
            Padding(
              padding: const EdgeInsets.all(ASizes.defaultSpace),
              child: Column(
                children: [
                  // user profile details
                  UserProfileTile(),
                  SizedBox(height: ASizes.spaceBtwItems),

                  //account setting heading
                  ASectionHeading(
                      title: 'Account Settings', showActionButton: false),

                  //setting menu
                  SettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set shopping delivery addresses',
                    onTap: () => Get.to(() => AddressScreen()),
                  ),
                  SettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                    onTap: () {
                      Get.to(() => CartScreen());
                    },
                  ),
                  SettingMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subtitle: 'In progress and Completed Orders',
                      onTap: () => Get.to(() => OrderScreen())),
                  SizedBox(height: ASizes.spaceBtwSections),

                  //logout button

                  SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                          onPressed: AuthenticationRepository.instance.logout,
                          child: Text('Logout'))),
                  SizedBox(height: ASizes.spaceBtwSections),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
