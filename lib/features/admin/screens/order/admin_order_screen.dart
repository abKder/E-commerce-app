import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/admin/controllers/order/admin_order_controller.dart';
import 'package:e_commerce/features/shop/models/order_model.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AdminOrderScreen extends StatelessWidget {
  const AdminOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AdminOrderController());

    return Scaffold(
      appBar: AAppBar(
        title: Text('Manage Orders',
            style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: false,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.allOrders.isEmpty) {
          return const Center(child: Text('No Orders Found'));
        }

        return ListView.separated(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          itemCount: controller.allOrders.length,
          separatorBuilder: (_, __) =>
              const SizedBox(height: ASizes.spaceBtwItems),
          itemBuilder: (_, index) {
            final order = controller.allOrders[index];
            return Container(
              padding: const EdgeInsets.all(ASizes.md),
              decoration: BoxDecoration(
                color: AHelperFunctions.inDarkMode(context)
                    ? AColors.dark
                    : AColors.light,
                borderRadius: BorderRadius.circular(ASizes.cardRadiusLg),
                border: Border.all(color: Colors.grey.withOpacity(0.1)),
              ),
              child: Column(
                children: [
                  // Row 1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(order.orderStatusText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                        color: AColors.primary,
                                        fontWeightDelta: 1)),
                            Text(order.formattedOrderDate,
                                style:
                                    Theme.of(context).textTheme.headlineSmall),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () =>
                              _showStatusDialog(context, controller, order),
                          icon: const Icon(Iconsax.arrow_right_34,
                              size: ASizes.iconSm)),
                    ],
                  ),
                  const SizedBox(height: ASizes.spaceBtwItems),

                  // Row 2
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.tag),
                            const SizedBox(width: ASizes.spaceBtwItems / 2),
                            Flexible(
                                child: Text(order.id,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis)),
                          ],
                        ),
                      ),
                      const SizedBox(width: ASizes.spaceBtwItems),
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Iconsax.calendar),
                            const SizedBox(width: ASizes.spaceBtwItems / 2),
                            Flexible(
                                child: Text(order.formattedDeliveryDate,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium)),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      }),
    );
  }

  void _showStatusDialog(
      BuildContext context, AdminOrderController controller, OrderModel order) {
    Get.defaultDialog(
      title: 'Update Status',
      content: Column(
        children: OrderStatus.values.map((status) {
          return ListTile(
            title: Text(status.name.toUpperCase()),
            leading: Radio<OrderStatus>(
              value: status,
              groupValue: order.status,
              onChanged: (OrderStatus? value) {
                if (value != null) {
                  controller.updateOrderStatus(order, value);
                  Get.back();
                }
              },
            ),
            onTap: () {
              controller.updateOrderStatus(order, status);
              Get.back();
            },
          );
        }).toList(),
      ),
    );
  }
}
