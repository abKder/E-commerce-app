import 'package:e_commerce/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/texts.dart';

class APrivacyPolicyCheckbox extends StatelessWidget {
  const APrivacyPolicyCheckbox({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    return Row(
      children: [
        Checkbox(value: true, onChanged: (value) {}),
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