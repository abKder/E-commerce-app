import 'package:e_commerce/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';

class ACartCounterIcon extends StatelessWidget {
  const ACartCounterIcon({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    bool dark = AHelperFunctions.inDarkMode(context);
    return Stack(
      children: [
        // bag icon
        IconButton(
            onPressed: () {},
            icon: Icon(Iconsax.shopping_bag),
            color: dark ? AColors.dark : AColors.light),
        // counter text
        Positioned(
            right: 6.0,
            child: Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                color: dark ?  AColors.dark : AColors.light,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text("10",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(
                        fontSizeFactor: 0.8,
                        color:
                        dark ? AColors.dark : AColors.light)),
              ),
            ))
      ],
    );
  }
}