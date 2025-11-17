import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/button/elevated_button.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class ALoginForm extends StatelessWidget {
  const ALoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Email
        TextFormField(
          decoration: InputDecoration(
              prefixIcon: Icon(Iconsax.direct_right),
              labelText: ATexts.email),
        ),
        SizedBox(height: ASizes.spaceBtwInputFields),

        //Password
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.direct_right),
            labelText: ATexts.password,
            suffixIcon: Icon(Iconsax.eye),
          ),
        ),
        SizedBox(height: ASizes.spaceBtwInputFields / 2),

        //Remember Me and forget password
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Checkbox(value: true, onChanged: (value){}),
                Text(ATexts.rememberMe),
              ],
            ),

            //Forget Password
            TextButton(
              onPressed: (){},
              child: Text(ATexts.forgetPassword),

            )


          ],
        ),
        SizedBox(height: ASizes.spaceBtwSections),

        //Sign in
        AElevatedButton(onPressed: (){}, child: Text(ATexts.signIn)),
        SizedBox(height: ASizes.spaceBtwItems / 2),

        //Create account
        AElevatedButton(onPressed: (){}, child: Text(ATexts.createAccount)),
      ],
    );
  }
}