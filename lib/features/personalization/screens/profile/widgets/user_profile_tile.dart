import 'package:e_commerce/features/personalization/screens/edit_profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text('Abdul Kader', style: Theme.of(context).textTheme.headlineSmall),
      subtitle: Text('abdulkader@gmail.com', style: Theme.of(context).textTheme.bodyMedium),
      trailing: IconButton(onPressed: () => Get.to(() => EditProfileScreen()), icon: Icon(Iconsax.edit)),
    );
  }
}