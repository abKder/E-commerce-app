import 'package:flutter/material.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/clipper/primary_header_container.dart';
import '../../../../../common/widgets/products/cart/cart_counter_icon.dart';
import '../../../../../common/widgets/textfields/search_bar.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class AStorePrimaryHeader extends StatelessWidget {
  const AStorePrimaryHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // height
        SizedBox(height: ASizes.storePrimaryHeaderHeight + 10),

        // header container
        APrimaryHeaderContainer(
          height: ASizes.storePrimaryHeaderHeight,
          child: AAppBar(
            title: Text('Store', style: Theme.of(context).textTheme.headlineMedium!.apply(color: AColors.white)),
            actions: [ACartCounterIcon()],
          )),

        //search bar
        ASearchBar(),
      ]
    );
  }
}