import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_counter_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/texts.dart';

class AHomeAppBar extends StatelessWidget {
  const AHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return AAppBar(
      // title and subtitle
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //appbar title
          Text(AHelperFunctions.getGreetingMessage(),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: AColors.white)),
          SizedBox(height: ASizes.spaceBtwItems / 3),

          //appbar sub title
          Obx(
            () {

              if(controller.profileLoading.value){
                return AShimmerEffect(width: 80, height: 15);
              }

             return Text(controller.user.value.fullName,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: AColors.white));
            },
          ),
        ],
      ),

      // bag icon
      actions: [ACartCounterIcon()],
    );
  }
}
