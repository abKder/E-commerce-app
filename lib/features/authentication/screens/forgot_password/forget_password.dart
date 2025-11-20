import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/authentication/screens/forgot_password/reset_password.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: APadding.screenPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //header
                //title
                Text(ATexts.forgetPasswordTitle,
                    style: Theme.of(context).textTheme.headlineMedium),
                SizedBox(height: ASizes.spaceBtwItems / 2),

                //subtitle
                Text(ATexts.forgetPasswordSubTitle,
                    style: Theme.of(context).textTheme.labelMedium),
                SizedBox(height: ASizes.spaceBtwSections * 2),

                //form
                Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: ATexts.email,
                        prefixIcon: Icon(Iconsax.direct_right),
                      ),
                    ),
                    SizedBox(height: ASizes.spaceBtwItems),
                    AElevatedButton(
                        onPressed: () => Get.to(() => ResetPasswordScreen()),
                        child: Text(ATexts.submit)),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
