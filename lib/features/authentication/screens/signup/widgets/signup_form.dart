import 'package:e_commerce/features/authentication/screens/signup/widgets/privacy_policy_checkbox.dart';
import 'package:e_commerce/utils/validatons/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../controllers/signup/signup_controller.dart';

class ASignupForm extends StatelessWidget {
  const ASignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            //First name and last name
            Row(
              children: [
                //First name
                Expanded(
                    child: TextFormField(
                      controller: controller.firstName,
                      validator: (value) => AValidator.validateEmptyText('First Name', value),
                  decoration: InputDecoration(
                    labelText: ATexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                )),
                SizedBox(width: ASizes.spaceBtwInputFields),

                //Last name
                Expanded(
                  child: TextFormField(
                      controller: controller.lastName,
                      validator: (value) => AValidator.validateEmptyText('Last Name', value),
                      decoration: InputDecoration(
                    labelText: ATexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  )),
                )
              ],
            ),
            SizedBox(height: ASizes.spaceBtwInputFields),

            //Email
            TextFormField(
              controller: controller.email,
              validator: (value) => AValidator.validateEmail(value),
              decoration: InputDecoration(
                labelText: ATexts.email,
                prefixIcon: Icon(Iconsax.direct_right),
              ),
            ),
            SizedBox(height: ASizes.spaceBtwInputFields),

            //Phone number
            TextFormField(
              controller: controller.phoneNumber,
              validator: (value) => AValidator.validatePhoneNumber(value),
              decoration: InputDecoration(
                labelText: ATexts.phoneNumber,
                prefixIcon: Icon(Iconsax.call),
              ),
            ),
            SizedBox(height: ASizes.spaceBtwInputFields),

            //Password
            Obx(
                () => TextFormField(
                  obscureText: controller.isPasswordVisible.value,
                  controller: controller.password,
                  validator: (value) => AValidator.validatePassword(value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: ATexts.password,
                    suffixIcon: IconButton(onPressed: () => controller.isPasswordVisible.value = !controller.isPasswordVisible.value, icon: Icon(controller.isPasswordVisible.value ? Iconsax.eye : Iconsax.eye_slash)),
                  ),
                )),
            SizedBox(height: ASizes.spaceBtwInputFields / 2),

            //Check box
            APrivacyPolicyCheckbox(),
            SizedBox(height: ASizes.spaceBtwItems),

//create account button
            AElevatedButton(
                onPressed: controller.registerUser,
                child: Text(ATexts.createAccount))
          ],
        ));
  }
}
