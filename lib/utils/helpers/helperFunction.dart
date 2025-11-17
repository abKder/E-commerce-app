import 'package:flutter/material.dart';

class AHelperFunctions{
  AHelperFunctions._();

  static bool inDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
}