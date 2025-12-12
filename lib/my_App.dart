import 'package:e_commerce/routes/app_routes.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'bindings/bindings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ATheme.lightTheme,
      darkTheme: ATheme.darkTheme,

      getPages: AAppRoutes.screens,



      initialBinding: ABindings(),
      home: Scaffold(
        backgroundColor: AColors.primary,
        body: Center(
          child: CircularProgressIndicator(color: AColors.white),
        ),
      ),
    );
  }
}
