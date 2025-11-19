import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/features/authentication/screens/login/login.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/texts.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => LoginScreen()),
              icon: Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: APadding.screenPadding,
          child: Column(
            children: [
              //images
              Image.asset(AImages.mailSentImage),
              SizedBox(height: ASizes.spaceBtwSections),
              //title
              Text(ATexts.resetPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: ASizes.spaceBtwInputFields),
              //email
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: ATexts.email),
              ),
              SizedBox(height: ASizes.spaceBtwInputFields),
              //subtitle

              //done
              AElevatedButton(onPressed: (){}, child: Text(ATexts.done)),
              //resend email

            ],
          ),
        ),
      ),
    );
  }
}
