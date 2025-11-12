import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AChipTheme {
  AChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: AColors.grey.withValues(alpha: 0.4),
    labelStyle: const TextStyle(color: AColors.black),
    selectedColor: AColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: AColors.white,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: AColors.darkerGrey,
    labelStyle: const TextStyle(color: AColors.white),
    selectedColor: AColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
    checkmarkColor: AColors.white,
  );
}
