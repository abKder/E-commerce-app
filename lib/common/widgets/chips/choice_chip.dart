import 'package:e_commerce/common/widgets/custom_shapes/clipper/circular_container.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class AChoiceChip extends StatelessWidget {
  const AChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    required this.onSelected,
  });

  final String text;
  final bool selected;
  final Function(bool?) onSelected;

  @override
  Widget build(BuildContext context) {
    bool isColor = AHelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColor ? SizedBox() : Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected ? AColors.white : null),
      shape: isColor ? CircleBorder() : null,
      padding: isColor ? EdgeInsets.zero : null,
      labelPadding: isColor ? EdgeInsets.zero : null,
      avatar: isColor ? ACircularContainer(width: 50.0, height: 50.0, backgroundColor: AHelperFunctions.getColor(text)!) : null,
      backgroundColor: isColor ? AHelperFunctions.getColor(text) : null,
    );
  }
}
