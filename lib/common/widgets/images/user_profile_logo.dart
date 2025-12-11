import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../features/personalization/controllers/user_controller.dart';
import '../../../utils/constants/images.dart';
import 'circular_image.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;

    return Obx(
        (){
          bool isProfileAvailable = controller.user.value.profilePicture.isNotEmpty;
          return ACircularImage(
            image: isProfileAvailable ? controller.user.value.profilePicture : AImages.profile,
            height: 120.0,
            width: 120.0,
            borderWidth: 5.0,
            padding: 0,
            isNetworkImage: isProfileAvailable ? true : false,
          );
        }
    );
  }
}