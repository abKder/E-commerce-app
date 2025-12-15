import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/products/cart/cart_item.dart';
import 'package:e_commerce/features/shop/models/order_model.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key, required this.order});

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AAppBar(
          title: Text('Order Details',
              style: Theme.of(context).textTheme.headlineMedium),
          showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(ASizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// -- Status Row
              Row(
                children: [
                  Text('Order Status',
                      style: Theme.of(context).textTheme.headlineSmall),
                  Spacer(),
                  Text(order.orderStatusText,
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                          color: order.status == OrderStatus.delivered
                              ? Colors.green
                              : Colors.blue)),
                ],
              ),
              const SizedBox(height: ASizes.spaceBtwItems),

              /// -- Date
              Text(order.formattedOrderDate),
              const SizedBox(height: ASizes.spaceBtwSections),

              /// -- Order Items
              Text('Items', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: ASizes.spaceBtwItems),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: order.items.length,
                separatorBuilder: (_, __) =>
                    const SizedBox(height: ASizes.spaceBtwItems),
                itemBuilder: (_, index) =>
                    ACartItem(cartItem: order.items[index]),
              ),
              const SizedBox(height: ASizes.spaceBtwSections),

              /// -- Shipping Info
              // Note: We need to adapt billing sections to accept data or just display text
              // For now, I'll create a simple display here since reuse might be tricky if widgets are coupled to controllers

              /// -- Billing Info
              Container(
                padding: const EdgeInsets.all(ASizes.md),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ASizes.cardRadiusLg),
                  border: Border.all(color: Colors.grey.withOpacity(0.1)),
                ),
                child: Column(
                  children: [
                    /// Price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style: Theme.of(context).textTheme.titleMedium),
                        Text('\$${order.totalAmount}',
                            style: Theme.of(context).textTheme.titleLarge),
                      ],
                    ),
                    const SizedBox(height: ASizes.spaceBtwItems),

                    /// Payment Method
                    Row(
                      children: [
                        const Icon(Icons.payment, size: 18),
                        const SizedBox(width: ASizes.spaceBtwItems / 2),
                        Text(order.paymentMethod,
                            style: Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const SizedBox(height: ASizes.spaceBtwItems),

                    /// Address
                    if (order.address != null) ...[
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 18),
                          const SizedBox(width: ASizes.spaceBtwItems / 2),
                          Expanded(
                              child: Text(
                                  '${order.address!.street}, ${order.address!.city}',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium)),
                        ],
                      ),
                    ]
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
