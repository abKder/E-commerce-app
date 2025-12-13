import 'package:e_commerce/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';

class ABrandsShimmer extends StatelessWidget {
  const ABrandsShimmer({super.key,this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(width: ASizes.spaceBtwItems),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (context, index) => AShimmerEffect(width: ASizes.brandCardWidth, height: ASizes.brandCardHeight),
    );
  }
}