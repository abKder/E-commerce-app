import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helperFunction.dart';

class ACircularImage extends StatelessWidget {
  const ACircularImage(
      {super.key,
        this.width = 56,
        this.height = 56,
        this.overlayColor,
        this.backgroundColor,
        required this.image,
        this.fit = BoxFit.cover,
        this.padding = ASizes.sm,
        this.isNetworkImage = false,
        this.showBorder = false,
        this.borderColor = AColors.primary,
        this.borderWidth = 1.0});

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;
  final bool showBorder;
  final Color borderColor;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: backgroundColor ?? (dark ? AColors.dark : AColors.light),
          borderRadius: BorderRadius.circular(100),
          border: showBorder ? Border.all(color: borderColor, width: borderWidth) : null),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: isNetworkImage
            ? CachedNetworkImage(
            fit: fit,
            color: overlayColor,
            progressIndicatorBuilder: (context, url, progress) => AShimmerEffect(width: 55, height: 55),
            errorWidget: (context, url, error) => Icon(Icons.error),
            imageUrl: image)
            : Image(fit: fit, image: AssetImage(image)),
      ),
    );
  }
}