import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/validatons/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
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
                    Form(
                        key: controller.forgetPasswordFormKey,
                        child: TextFormField(
                          controller: controller.email,
                          validator: (value) => AValidator.validateEmail(value),
                          decoration: InputDecoration(
                            labelText: ATexts.email,
                            prefixIcon: Icon(Iconsax.direct_right),
                          ),
                        )),
                    SizedBox(height: ASizes.spaceBtwItems),

                    //submit button
                    AElevatedButton(
                        onPressed: controller.sendPasswordResetEmail,
                        child: Text(ATexts.submit)),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
