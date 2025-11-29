import 'package:flutter/material.dart';

class AProductPriceText extends StatelessWidget {
  const AProductPriceText(
      {super.key,
        this.currentSign = '\$',
        required this.price,
        this.maxLines = 1,
        this.isLarge = false,
        this.lineThrough = false});

  final String currentSign, price;
  final int maxLines;
  final bool isLarge, lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(currentSign + price,
        style: isLarge
            ? Theme.of(context)
            .textTheme
            .headlineMedium!
            .apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context)
            .textTheme
            .titleLarge!
            .apply(decoration: lineThrough ? TextDecoration.lineThrough : null),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis);
  }
}