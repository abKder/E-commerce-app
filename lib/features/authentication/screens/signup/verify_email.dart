import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/texts.dart';
import '../../controllers/signup/verify_email_controller.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: AuthenticationRepository.instance.logout,
              icon: Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: APadding.screenPadding,
          child: Column(
            children: [
              //images
              Image.asset(AImages.mailSentImage,
                  height: ADeviceHelper.getScreenHeight(context) * 0.4),
              SizedBox(height: ASizes.spaceBtwItems),

              //title
              Text(ATexts.verifyEmailTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              SizedBox(height: ASizes.spaceBtwInputFields),

              //email
              Text(email ?? '', style: Theme.of(context).textTheme.bodyMedium),
              SizedBox(height: ASizes.spaceBtwInputFields),

              //subtitle
              Text(
                ATexts.verifyEmailSubTitle,
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ASizes.spaceBtwSections),

              //continue button
              AElevatedButton(
                  onPressed: controller.checkEmailVerificationStatus,
                  child: Text(ATexts.AContinue)),

              //resend email
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () => controller.sendEmailVerification,
                      child: Text(ATexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
