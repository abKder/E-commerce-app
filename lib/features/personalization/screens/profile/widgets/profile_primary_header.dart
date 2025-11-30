import 'package:flutter/material.dart';
import '../../../../../common/widgets/custom_shapes/clipper/primary_header_container.dart';
import '../../../../../common/widgets/images/user_profile_logo.dart';
import '../../../../../utils/constants/sizes.dart';

class AProfilePrimaryHeader extends StatelessWidget {
  const AProfilePrimaryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        ///total height
        SizedBox(height: ASizes.profilePrimaryHeaderHeight + 60),

        //primary header
        APrimaryHeaderContainer(
          height: ASizes.profilePrimaryHeaderHeight,
          child: Container(),
        ),

        //user profile
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: UserProfileLogo(),
            )),

      ],
    );
  }
}