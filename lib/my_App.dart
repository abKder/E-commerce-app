import 'package:e_commerce/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'features/authentication/screens/onBoarding/onBoarding.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ATheme.lightTheme,
      darkTheme: ATheme.darkTheme,
      home:OnBoardingScreen(),
    );
  }
}