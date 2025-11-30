import 'package:flutter/material.dart';
import '../../../utils/constants/images.dart';
import 'circular_image.dart';

class UserProfileLogo extends StatelessWidget {
  const UserProfileLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ACircularImage(
        image: AImages.profile,
        height: 120.0,
        width: 120.0,
        borderWidth: 5.0,
        padding: 0
    );
  }
}