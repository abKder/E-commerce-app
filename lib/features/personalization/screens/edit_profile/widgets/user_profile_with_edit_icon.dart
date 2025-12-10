import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/user_profile_logo.dart';

class UserProfileWithEditeIcon extends StatelessWidget {
  const UserProfileWithEditeIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //user profile logo
        Center(child: UserProfileLogo()),

        Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: ACircularIcon(icon: Iconsax.edit),
            ))
      ],
    );
  }
}