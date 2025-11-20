import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/helpers/device_helpers.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: APadding.screenPadding,
          child: Column(
            children: [

              //image
              Image.asset(AImages.accountCreatedImage,
                  height: ADeviceHelper.getScreenHeight(context) * 0.4),
              SizedBox(height: ASizes.spaceBtwItems),

              //Title
              Text(ATexts.accountCreatedTitle,
                  style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              SizedBox(height: ASizes.spaceBtwItems),

              //subtitle
              Text(ATexts.accountCreatedSubTitle,
                  style: Theme.of(context).textTheme.bodySmall, textAlign: TextAlign.center),
              SizedBox(height: ASizes.spaceBtwSections),

              //continue button
              AElevatedButton(onPressed: () {}, child: Text(ATexts.AContinue)),
            ],
          ),
        ),
      ),
    );
  }
}
