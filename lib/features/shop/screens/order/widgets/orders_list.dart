import 'package:e_commerce/common/widgets/custom_shapes/clipper/rounded_container.dart';
import 'package:e_commerce/common/widgets/loaders/animation_loader.dart';
import 'package:e_commerce/features/shop/controllers/order/order_controller.dart';
import 'package:e_commerce/features/shop/screens/order/order_details.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AOrdersListItems extends StatelessWidget {
  const AOrdersListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    final controller = Get.put(OrderController());

    return Obx(
      () {
        // If you want a specific loading state, you can add isLoading to controller
        // For now, if empty, we assume loading or empty.
        // Ideally: check controller.isLoading.value ??

        // Since I didn't add isLoading to controller (my bad on partial plan execution),
        // I'll assume empty means empty for now or add isLoading in next step if needed.
        // Actually, let's just use the list. If it's empty, we show empty state.
        // To be safer, I should have added isLoading.
        // For now:
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.userOrders.isEmpty) {
          return AAnimationLoader(
            text: 'Whoops! No Orders Yet!',
            animation: AImages.orderCompletedAnimation,
            showActionButton: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.back(),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          itemCount: controller.userOrders.length,
          separatorBuilder: (_, __) => SizedBox(height: ASizes.spaceBtwItems),
          itemBuilder: (_, index) {
            final order = controller.userOrders[index];
            return ARoundedContainer(
              showBorder: true,
              backgroundColor: dark ? AColors.dark : AColors.light,
              padding: EdgeInsets.all(ASizes.md),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // -- Row 1: Icon, Status, Date
                  Row(
                    children: [
                      Icon(Iconsax.ship),
                      SizedBox(width: ASizes.spaceBtwItems / 2),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order.orderStatusText,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .apply(
                                      color: AColors.primary,
                                      fontWeightDelta: 1),
                            ),
                            Text(
                              order.formattedOrderDate,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () =>
                            Get.to(() => OrderDetailsScreen(order: order)),
                        icon: Icon(Iconsax.arrow_right_34, size: ASizes.iconSm),
                      ),
                    ],
                  ),
                  SizedBox(height: ASizes.spaceBtwItems),

                  // -- Row 2: Details
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Iconsax.tag),
                            SizedBox(width: ASizes.spaceBtwItems / 2),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Order',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium),
                                  Text(order.id,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(Iconsax.calendar),
                            SizedBox(width: ASizes.spaceBtwItems / 2),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Shipping Date',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium),
                                  Text(order.formattedDeliveryDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // -- Divider if needed for visual separation or cleaner look
                ],
              ),
            );
          },
        );
      },
    );
  }
}
