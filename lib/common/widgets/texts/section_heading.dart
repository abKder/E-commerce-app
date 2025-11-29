import 'package:flutter/material.dart';

class ASectionHeading extends StatelessWidget {
  const ASectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
  });

  final String title, buttonTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context).textTheme.headlineSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
        TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}
