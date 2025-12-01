import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class AChoiceChip extends StatelessWidget {
  const AChoiceChip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
        label: Text('Red'),
        selected: true,
        onSelected: (value) {},
        labelStyle: TextStyle(color: AColors.white));
  }
}