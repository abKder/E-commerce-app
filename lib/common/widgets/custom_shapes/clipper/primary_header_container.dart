import 'package:flutter/cupertino.dart';
import 'circular_container.dart';
import 'rounded_edges_container.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';

class APrimaryHeaderContainer extends StatelessWidget {
  const APrimaryHeaderContainer({
    super.key,
    required this.child,
    required this.height,
  });

  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return ARoundedEdgesContainer(
      child: Container(
        height: height,
        color: AColors.primary,
        child: Stack(
          children: [

            /// Circular Container
            Positioned(
              top: -150,
              right: -160,
              child: ACircularContainer(
                  height: ASizes.homePrimaryHeaderHeight,
                  width: ASizes.homePrimaryHeaderHeight,
                  backgroundColor: AColors.white.withValues(alpha: 0.1)
              ),
            ),

            /// Circular Container
            Positioned(
                top: 50,
                right: -250,
                child: ACircularContainer(
                  height: ASizes.homePrimaryHeaderHeight,
                  width: ASizes.homePrimaryHeaderHeight,
                  backgroundColor: AColors.white.withValues(alpha: 0.1),
                )
            ),

            /// Child
            child
          ],
        ),
      ),
    );
  }
}