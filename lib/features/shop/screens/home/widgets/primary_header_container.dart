import 'package:flutter/cupertino.dart';
import '../../../../../common/widgets/button/custom_shapes/circular_container.dart';
import '../../../../../common/widgets/button/custom_shapes/clipper/rounded_edges_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/device_helpers.dart';

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
          height: ADeviceHelper.getScreenHeight(context) * 0.4,
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