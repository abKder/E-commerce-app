import 'package:flutter/material.dart';
import '../../../../../common/widgets/button/custom_shapes/circular_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';

class AHomeCategories extends StatelessWidget {
  const AHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        //heading part
        Text(ATexts.popularCategories,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: AColors.white)),
        SizedBox(height: ASizes.spaceBtwItems / 2),

        //Categories list
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (context, index) {
              return Column(
                children: [

                  //circular image
                  ACircularContainer(
                      height: 56,
                      width: 56,

                  ),

                  //title
                  SizedBox(
                      width: 55,
                      child: Text("Sport Categories",
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(color: AColors.white),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center)),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
