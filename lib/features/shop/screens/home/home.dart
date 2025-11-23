import 'package:e_commerce/features/shop/screens/home/widgets/AHomeCategories.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/textfields/search_bar.dart';
import '../../../../utils/helpers/helperFunction.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = AHelperFunctions.inDarkMode(context);
    return Scaffold(
        body: Stack(
      children: [
        // height
        SizedBox(height: ASizes.homePrimaryHeaderHeight + 20),

        // header container
        APrimaryHeaderContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //appbar
            AHomeAppBar(dark: dark),
            SizedBox(height: ASizes.spaceBtwSections),

            // home categories
            Text(ATexts.popularCategories, style: Theme.of(context).textTheme.headlineSmall! .apply(color: AColors.white)),

            AHomeCategories(),
          ],
        )),

        //search bar
        ASearchBar(),


      ],
    ));
  }
}