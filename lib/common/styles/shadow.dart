import 'package:flutter/cupertino.dart';
import '../../utils/constants/colors.dart';

class AShadow{
  AShadow._();

  static List<BoxShadow> searchBarShadow = [
    BoxShadow(
      color: AColors.black.withValues(alpha: 0.1),
      spreadRadius: 6.0,
      blurRadius: 4.0,
    )
  ];

  static List<BoxShadow> verticalProductShadow = [BoxShadow(
    color: AColors.darkGrey.withValues(alpha: 0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  )];
}