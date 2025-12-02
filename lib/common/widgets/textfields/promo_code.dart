import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';
import '../custom_shapes/clipper/rounded_container.dart';

class APromoCodeField extends StatelessWidget {
  const APromoCodeField({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    return ARoundedContainer(
      showBorder: true,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.only(
          left: ASizes.md,
          top: ASizes.sm,
          right: ASizes.sm,
          bottom: ASizes.sm),
      child: Row(
        children: [
          Flexible(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Have a promo code? Enter here',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
              )),
          SizedBox(
              width: 80.0,
              child: ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.withValues(alpha: 0.2),
                    foregroundColor: dark ? AColors.white.withValues(alpha: 0.5) : AColors.dark.withValues(alpha: 0.5),
                    side: BorderSide(color: AColors.grey.withValues(alpha: 0.1))
                ),
                child: Text('Apply'),
              ))
        ],
      ),
    );
  }
}