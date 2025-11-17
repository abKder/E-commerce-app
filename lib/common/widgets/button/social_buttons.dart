import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/constants/sizes.dart';

class ASocialButtons extends StatelessWidget {
  const ASocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //google
        buildButton( AImages.googleIcon, (){}),
        SizedBox(width: ASizes.spaceBtwItems),

        //facebook
        buildButton( AImages.facebookIcon, (){}),
        SizedBox(width: ASizes.spaceBtwItems),

        //instagram
        buildButton( AImages.instagramIcon, (){}),
        SizedBox(width: ASizes.spaceBtwItems),

        //web
        buildButton( AImages.webIcon, (){}),
      ],
    );
  }

  Container buildButton(String image, VoidCallback onPressed) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: AColors.grey),
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(
            onPressed: onPressed,
            icon: Image.asset(image,
                height: ASizes.iconMd, width: ASizes.iconMd)),
      );
  }
}
