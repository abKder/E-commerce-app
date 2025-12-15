import 'package:e_commerce/data/repositories/brand/brand_repository.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/custom_shapes/clipper/rounded_container.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/texts/brand_title_with_verify_icon.dart';
import '../../../../../common/widgets/texts/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class AProductMetaData extends StatelessWidget {
  const AProductMetaData({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final brandRepository = Get.put(BrandRepository());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //sale tag
        Row(
          children: [
            ARoundedContainer(
              radius: ASizes.sm,
              backgroundColor: AColors.yellow.withValues(alpha: 0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: ASizes.sm, vertical: ASizes.xs),
              child: Text(
                  '${((product.price - product.salePrice) / product.price * 100).round()}%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: AColors.black)),
            ),
            SizedBox(width: ASizes.spaceBtwItems),

            Text('\$${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough)),
            SizedBox(width: ASizes.spaceBtwItems),

            //actual price
            AProductPriceText(
                price: product.salePrice > 0
                    ? product.salePrice.toString()
                    : product.price.toString(),
                isLarge: true),
            Spacer(),

            //share button
            IconButton(onPressed: () {}, icon: Icon(Iconsax.share))
          ],
        ),
        SizedBox(height: ASizes.spaceBtwItems / 1.5),

        //product title
        AProductTitleText(title: product.title),
        SizedBox(height: ASizes.spaceBtwItems / 1.5),

        //product status
        Row(
          children: [
            AProductTitleText(title: 'Status'),
            SizedBox(width: ASizes.spaceBtwItems),
            Text(product.stock > 0 ? 'In Stock' : 'Out of Stock',
                style: Theme.of(context).textTheme.titleMedium)
          ],
        ),
        SizedBox(height: ASizes.spaceBtwItems / 1.5),

        // Brand Row with fetch logic
        if (product.brand != null)
          FutureBuilder(
              future: brandRepository.getSingleBrand(product.brand!.id),
              builder: (context, snapshot) {
                final response = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator());
                }

                if (snapshot.hasData && response != null) {
                  return Row(
                    children: [
                      ACircularImage(
                        padding: 0,
                        isNetworkImage: true,
                        image: response.image,
                        width: 32.0,
                        height: 32.0,
                      ),
                      SizedBox(width: ASizes.spaceBtwItems),
                      ABrandTitleWithVerifyIcon(title: response.name),
                    ],
                  );
                }

                // Fallback to product embedded brand if fetch fails or waiting?
                // Or just return empty.
                return Row(
                  children: [
                    ACircularImage(
                      padding: 0,
                      isNetworkImage: true,
                      image: product.brand!.image,
                      width: 32.0,
                      height: 32.0,
                    ),
                    SizedBox(width: ASizes.spaceBtwItems),
                    ABrandTitleWithVerifyIcon(title: product.brand!.name),
                  ],
                );
              })
      ],
    );
  }
}
