import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import '../../../../utils/constants/colors.dart';

class ACircularContainer extends StatelessWidget {
  const ACircularContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ASizes.homePrimaryHeaderHeight,
      width: ASizes.homePrimaryHeaderHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        color: AColors.white.withValues(alpha: 0.1),
      ),
    );
  }
}