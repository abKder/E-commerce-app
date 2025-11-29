import 'package:flutter/cupertino.dart';
import '../../../utils/constants/sizes.dart';

class ARoundedImage extends StatelessWidget {
  const ARoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.inNetworkImage = false,
    this.onTap,
    this.borderRadius = ASizes.md,
  });

  final String imageUrl;
  final double? width, height;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool inNetworkImage;
  final VoidCallback? onTap;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: Image(
              image: inNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl),
              fit: fit),
        ),
      ),
    );
  }
}