import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/helperFunction.dart';

class AFormDivider extends StatelessWidget {
  const AFormDivider({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    return Row(
      children: [
        Expanded(child: Divider(indent: 60, endIndent: 5, thickness: 0.5, color: dark ? AColors.darkGrey : AColors.grey)),
        Text(title, style: Theme.of(context).textTheme.labelMedium),
        Expanded(child: Divider(indent: 5, endIndent: 60, thickness: 0.5, color: dark ? AColors.darkGrey : AColors.grey)),
      ],
    );
  }
}