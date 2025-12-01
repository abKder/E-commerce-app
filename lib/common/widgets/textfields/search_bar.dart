import 'package:e_commerce/common/styles/shadow.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/texts.dart';

class ASearchBar extends StatelessWidget {
  const ASearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool dark = AHelperFunctions.inDarkMode(context);
    return Positioned(
        bottom: 0,
        right: ASizes.spaceBtwSections,
        left: ASizes.spaceBtwSections,
        child: Container(
          height: ASizes.searchBarHeight,
          padding: EdgeInsets.symmetric(horizontal: ASizes.md),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ASizes.borderRadiusLg),
              color: dark ? AColors.dark : AColors.light,
              boxShadow: AShadow.searchBarShadow,
          ),
          child: Row(
            children: [

              //search icon
              Icon(Iconsax.search_normal, color: AColors.darkGrey),
              SizedBox(width: ASizes.spaceBtwItems),

              //search bar title
              Text(ATexts.searchBarTitle, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ));
  }
}