import 'package:flutter/material.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class ALoginHeader extends StatelessWidget {
  const ALoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Title
        Text(ATexts.loginTitle,
            style: Theme.of(context).textTheme.headlineMedium),
        SizedBox(
          height: ASizes.sm,
        ),
        //Subtitle
        Text(ATexts.loginSubTitle,
            style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}