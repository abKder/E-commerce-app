import 'package:e_commerce/features/authentication/screens/signup/widgets/privacy_policy_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../verify_email.dart';

class ASignupForm extends StatelessWidget {
  const ASignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //First name and last name
        Row(
          children: [
            //First name
            Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: ATexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                )),
            SizedBox(width: ASizes.spaceBtwInputFields),

            //Last name
            Expanded(
              child: TextFormField(
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
          decoration: InputDecoration(
            labelText: ATexts.email,
            prefixIcon: Icon(Iconsax.direct_right),
          ),
        ),
        SizedBox(height: ASizes.spaceBtwInputFields),

        //Phone number
        TextFormField(
          decoration: InputDecoration(
            labelText: ATexts.phoneNumber,
            prefixIcon: Icon(Iconsax.call),
          ),
        ),
        SizedBox(height: ASizes.spaceBtwInputFields),

        //Password
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            labelText: ATexts.password,
            suffixIcon: Icon(Iconsax.eye),
          ),
        ),
        SizedBox(height: ASizes.spaceBtwInputFields / 2),

        //Check box
        APrivacyPolicyCheckbox(),
        SizedBox(height: ASizes.spaceBtwItems),


        AElevatedButton(onPressed: () => Get.to(() => VerifyEmailScreen()), child: Text(ATexts.createAccount) ),
      ],
    );
  }
}

