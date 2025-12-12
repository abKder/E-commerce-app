import 'package:e_commerce/common/widgets/images/circular_image.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../custom_shapes/clipper/circular_container.dart';

class AVerticalImageText extends StatelessWidget {
  const AVerticalImageText({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
    required this.textColor,
    this.backgroundColor,
  });

  final String title, image;
  final Color textColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    bool dark = AHelperFunctions.inDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          //circular image
          ACircularImage(
              height: 56,
              width: 56,
              image: image,
              isNetworkImage: image.startsWith('http')),
          SizedBox(height: ASizes.spaceBtwItems / 2),

          //title
          SizedBox(
              width: 55,
              child: Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center)),
        ],
      ),
    );
  }
}
