import 'package:e_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/primary_header_container.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/helperFunction.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool dark = AHelperFunctions.inDarkMode(context);
    return Scaffold(
        body: APrimaryHeaderContainer(
            child: Column(
      children: [
        AHomeAppBar(dark: dark),
      ],
    )));
  }
}