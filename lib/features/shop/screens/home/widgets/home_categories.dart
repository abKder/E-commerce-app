import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';
import '../../../../../common/widgets/image_text/vertical_image_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class AHomeCategories extends StatelessWidget {
  const AHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: ASizes.spaceBtwSections),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //heading part
          Text(ATexts.popularCategories,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: AColors.white)),
          SizedBox(height: ASizes.spaceBtwItems),

          //Categories list
          SizedBox(
            height: 80,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: ASizes.spaceBtwItems),
              scrollDirection: Axis.horizontal,
              itemCount: 10, //item add
              itemBuilder: (context, index) {
                return AVerticalImageText(
                  title: "Food",
                  image: AImages.food,
                  textColor: AColors.white,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
