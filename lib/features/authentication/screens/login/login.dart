import 'package:e_commerce/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_commerce/features/authentication/screens/login/widgets/login_header.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/styles/padding.dart';
import '../../../../common/widgets/button/social_buttons.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(),
        body: SingleChildScrollView(
            padding: APadding.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Header section start here
                //Title and subtitle
                ALoginHeader(),
                SizedBox(height: ASizes.spaceBtwSections),

                // Form
                ALoginForm(),
                SizedBox(height: ASizes.spaceBtwItems),

                //divider
                AFormDivider(title:ATexts.orSignInWith),
                SizedBox(height: ASizes.spaceBtwSections),

                //Footer
                //social buttons
                ASocialButtons()
              ],
            )));
  }
}




