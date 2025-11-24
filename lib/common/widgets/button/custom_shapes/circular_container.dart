import 'package:flutter/cupertino.dart';
import '../../../../utils/constants/colors.dart';

class ACircularContainer extends StatelessWidget {
  const ACircularContainer({
    super.key,
     this.height = 400,
    this.width = 400,
     this.radius = 400,
     this.backgroundColor = AColors.white,
    this.padding,
    this.margin,
    this.child,
  });

  final double height, width, radius;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding, margin;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color:backgroundColor,
      ),
    );
  }
}
