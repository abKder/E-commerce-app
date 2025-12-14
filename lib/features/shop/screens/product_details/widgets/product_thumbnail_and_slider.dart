import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../common/widgets/products/favourite_icon/favourite_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../features/shop/models/product_model.dart';

class AProductThumbnailAndSlider extends StatelessWidget {
  const AProductThumbnailAndSlider({
    super.key,
    required this.dark,
    required this.product,
  });

  final bool dark;
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: dark ? AColors.darkerGrey : AColors.light,
      child: Stack(
        children: [
          //image thumbnail
          SizedBox(
              height: 400,
              child: Padding(
                  padding: EdgeInsets.all(ASizes.productImageRadius * 2),
                  child: Center(
                      child: ARoundedImage(
                          imageUrl: product.thumbnail, isNetworkImage: true)))),

          // image slider
          Positioned(
              left: ASizes.defaultSpace,
              right: 0,
              bottom: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        SizedBox(width: ASizes.spaceBtwItems),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: product.images?.length ?? 0,
                    itemBuilder: (context, index) => ARoundedImage(
                        width: 80,
                        backgroundColor: dark ? AColors.dark : AColors.white,
                        padding: EdgeInsets.all(ASizes.sm),
                        border: Border.all(color: AColors.primary),
                        imageUrl: product.images?[index] ?? '',
                        isNetworkImage: true)),
              )),

          //appbar  back arrow and favourite button
          //appbar  back arrow and favourite button
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 90,
              child: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                leading: Padding(
                  padding: const EdgeInsets.only(left: ASizes.defaultSpace),
                  child: ACircularIcon(
                    icon: Iconsax.arrow_left_2,
                    onPressed: () => Get.back(),
                  ),
                ),
                actions: [
                  AFavoriteIcon(productId: product.id),
                  SizedBox(width: ASizes.defaultSpace),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
