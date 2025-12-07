import 'package:e_commerce/features/authentication/controllers/login/login_controller.dart';
import 'package:e_commerce/utils/validatons/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../forgot_password/forget_password.dart';
import '../../signup/signup.dart';

class ALoginForm extends StatelessWidget {
  const ALoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    return Form(
        key: controller.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Email
            TextFormField(
              controller: controller.email,
              validator: (value) => AValidator.validateEmail(value),
              decoration: InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: ATexts.email),
            ),
            SizedBox(height: ASizes.spaceBtwInputFields),

            //Password
            Obx(
                () => TextFormField(
                  controller: controller.password,
                  obscureText: controller.isPasswordVisible.value,
                  validator: (value) => AValidator.validateEmptyText('Password', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: ATexts.password,
                    suffixIcon: IconButton(onPressed: () => controller.isPasswordVisible.toggle(),
                        icon: Icon(controller.isPasswordVisible.value ? Iconsax.eye_slash : Iconsax.eye)),
                  ),
                )
            ),
            SizedBox(height: ASizes.spaceBtwInputFields / 2),

            //Remember Me and forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx( () => Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.toggle())),
                    Text(ATexts.rememberMe),
                  ],
                ),

                //Forget Password
                TextButton(
                  onPressed: () => Get.to(() => ForgetPasswordScreen()),
                  child: Text(ATexts.forgetPassword),
                )
              ],
            ),
            SizedBox(height: ASizes.spaceBtwSections),

            //Sign in
            AElevatedButton(
                onPressed: controller.loginWithEmailAndPassword,
                child: Text(ATexts.signIn)),
            SizedBox(height: ASizes.spaceBtwItems / 2),

            //Create account
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () => Get.to(() => SignupScreen()),
                  child: Text(ATexts.createAccount)),
            )
          ],
        ));
  }
}
