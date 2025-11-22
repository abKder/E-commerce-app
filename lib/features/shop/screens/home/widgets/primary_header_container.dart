import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import '../../../../../common/widgets/button/custom_shapes/circular_container.dart';
import '../../../../../common/widgets/button/custom_shapes/clipper/rounded_edges_container.dart';
import '../../../../../utils/constants/colors.dart';

class APrimaryHeaderContainer extends StatelessWidget {
  const APrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ARoundedEdgesContainer(child: child);
  }
}

class ARoundedEdgesContainer extends StatelessWidget {
  const ARoundedEdgesContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ARoundedEdges(
     child: Container(
          height: ASizes.homePrimaryHeaderHeight,
          color: AColors.primary,
          child: Stack(
            children: [
              Positioned(
                  top: -150,
                  right: -250,
                  child: ACircularContainer()),

              Positioned(
                  top: 50,
                  right: -250,
                  child: ACircularContainer()),
              child
            ],
          ),
        ),
    );
  }
}