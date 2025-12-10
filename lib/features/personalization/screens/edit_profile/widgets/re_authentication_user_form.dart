import 'package:e_commerce/common/styles/padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../../../utils/validatons/validation.dart';
import '../../../controllers/user_controller.dart';

class ReAuthenticationUserForm extends StatelessWidget {
  const ReAuthenticationUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AAppBar( showBackArrow: true, title: Text('Re-Authenticate User')),

      body: SingleChildScrollView(
        child: Padding(
          padding: APadding.screenPadding,
          child: Form(
            key: controller.reAuthFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Email
                TextFormField(
                  controller: controller.email,
                  validator: AValidator.validateEmail,
                  decoration: InputDecoration(prefixIcon: Icon(Iconsax.direct_right),labelText: ATexts.email),
                ),
                SizedBox(height: ASizes.spaceBtwInputFields,),

                /// Password
                Obx(
                      ()=> TextFormField(
                    controller: controller.password,
                    validator: (value) => AValidator.validateEmptyText('Password', value),
                    obscureText: controller.isPasswordVisible.value,
                    decoration: InputDecoration(
                        labelText: ATexts.password,
                        prefixIcon: Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: () => controller.isPasswordVisible.toggle,
                          icon: Icon(controller.isPasswordVisible.value ? Iconsax.eye_slash : Iconsax.eye),
                        )
                    ),
                  ),
                ),
               SizedBox(height: ASizes.spaceBtwSections),

                /// Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(onPressed: controller.reAuthenticateUser,
                    child: Text('verify'),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}