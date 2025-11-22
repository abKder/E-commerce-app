import 'package:flutter/cupertino.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/device_helpers.dart';

class ACircularContainer extends StatelessWidget {
  const ACircularContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ADeviceHelper.getScreenHeight(context) * 0.4,
      width: ADeviceHelper.getScreenHeight(context) * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        color: AColors.white.withValues(alpha: 0.1),
      ),
    );
  }
}