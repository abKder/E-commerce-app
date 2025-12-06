import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/texts.dart';
import '../../../controllers/signup/signup_controller.dart';

class APrivacyPolicyCheckbox extends StatelessWidget {
  const APrivacyPolicyCheckbox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    final controller = SignupController.instance;
    return Row(
      children: [
        Obx( () => Checkbox(value: controller.privacyPolicy.value, onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value)),
        RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.bodyMedium,
                children: [
                  TextSpan(text: "${ATexts.iAgreeTo}  "),

                  TextSpan(
                      text: ATexts.privacyPolicy,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                          color: dark ? AColors.white : AColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: dark ? AColors.white : AColors.primary)),
                  TextSpan(text: "  ${ATexts.and}  "),

                  TextSpan(
                      text: ATexts.termsOfUse,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                          color: dark ? AColors.white : AColors.primary,
                          decoration: TextDecoration.underline,
                          decorationColor: dark ? AColors.white : AColors.primary)),
                ]))
      ],
    );
  }
}