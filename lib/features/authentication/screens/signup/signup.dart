import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/button/social_buttons.dart';
import 'package:e_commerce/common/widgets/login_signup/form_divider.dart';
import 'package:e_commerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:e_commerce/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: APadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Header
              Text(ATexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: ASizes.spaceBtwSections),

              //Form
              ASignupForm(),
              SizedBox(height: ASizes.spaceBtwSections),
              
              //Divider
              AFormDivider(title: ATexts.orSignInWith),
              SizedBox(height: ASizes.spaceBtwSections),

              //Footer
              ASocialButtons(),

            ],
          ),
        ),
      ),
    );
  }
}


