import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/features/personalization/screens/change_name/change_name.dart';
import 'package:e_commerce/features/personalization/screens/edit_profile/widgets/user_profile_with_edit_icon.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => {Get.back()},
          icon: Icon(Iconsax.arrow_left),
        ),
        title: Text('Edit Profile',
            style: Theme.of(context).textTheme.headlineMedium),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: APadding.screenPadding,
          child: Column(
            children: [
              //user profile with edit icon
              UserProfileWithEditeIcon(),
              SizedBox(height: ASizes.spaceBtwSections),

              //divider
              Divider(),
              SizedBox(height: ASizes.spaceBtwItems),

              //account setting heading
              ASectionHeading(
                  title: 'Account Setting', showActionButton: false),
              SizedBox(height: ASizes.spaceBtwItems),

              //account details
              UserDetailRow(
                  title: 'Name',
                  value: controller.user.value.fullName,
                  onTap: () => Get.to(() => ChangeNameScreen())),
              UserDetailRow(
                  title: 'Username',
                  value: controller.user.value.email,
                  onTap: () {}),
              SizedBox(height: ASizes.spaceBtwItems),

              //divider
              Divider(),
              SizedBox(height: ASizes.spaceBtwItems),

              //profile section heading
              ASectionHeading(
                  title: 'Profile Setting', showActionButton: false),
              SizedBox(height: ASizes.spaceBtwItems),

              //profile setting
              UserDetailRow(
                  title: 'User ID',
                  value: controller.user.value.id,
                  onTap: () {}),
              UserDetailRow(
                  title: 'Email',
                  value: controller.user.value.email,
                  onTap: () {}),
              UserDetailRow(
                  title: 'Phone Number',
                  value: controller.user.value.phoneNumber,
                  onTap: () {}),
              UserDetailRow(title: 'Gender', value: '....', onTap: () {}),
              SizedBox(height: ASizes.spaceBtwItems),

              //divider
              Divider(),
              SizedBox(height: ASizes.spaceBtwItems),

              //close account button
              TextButton(
                  onPressed: controller.deleteAccountWarningPopup,
                  child: Text('Account Delete',
                      style: TextStyle(color: Colors.red)))
            ],
          ),
        ),
      ),
    );
  }
}

class UserDetailRow extends StatelessWidget {
  const UserDetailRow({
    super.key,
    required this.title,
    required this.value,
    this.icon = Iconsax.arrow_right_34,
    required this.onTap,
  });

  final String title, value;
  final IconData icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: ASizes.spaceBtwItems / 1.5),
        child: Row(
          children: [
            Expanded(
                flex: 3,
                child: Text(title,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis)),
            Expanded(
                flex: 5,
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                )),
            Expanded(child: Icon(icon, size: ASizes.iconSm))
          ],
        ),
      ),
    );
  }
}
