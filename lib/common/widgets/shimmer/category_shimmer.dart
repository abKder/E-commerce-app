import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';

class ACategoryShimmer extends StatelessWidget {
  const ACategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: ASizes.spaceBtwItems,
        ),
        itemBuilder: (context, index) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              AShimmerEffect(
                width: 55,
                height: 55,
                radius: 55,
              ),
              SizedBox(height: ASizes.spaceBtwItems / 2),

              /// Text
              AShimmerEffect(width: 55, height: 8)
            ],
          );
        },
      ),
    );
  }
}