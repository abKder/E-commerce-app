import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/helpers/device_helpers.dart';
import '../../../utils/helpers/helperFunction.dart';

class ATapBar extends StatelessWidget implements PreferredSizeWidget{
  const ATapBar({
    super.key, required this.tabs,
  });

  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    return Material(
      color: dark ? AColors.black : AColors.white,
      child: TabBar(
        isScrollable: true,
        labelColor: dark ? AColors.white : AColors.primary,
        unselectedLabelColor: AColors.darkGrey,
        indicatorColor: AColors.primary,
        tabs: tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(ADeviceHelper.getAppBarHeight());
}