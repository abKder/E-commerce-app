import 'package:e_commerce/common/widgets/shimmer/category_shimmer.dart';
import 'package:e_commerce/features/shop/controllers/category/category_controller.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/image_text/vertical_image_text.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/texts.dart';
import '../../sub_category/sub_gategory.dart';

class AHomeCategories extends StatelessWidget {
  const AHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
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
          Obx(
              (){
                final categories = controller.featuredCategories;

                //loading category
                if(controller.isCategoriesLoading.value){
                  return ACategoryShimmer(itemCount: 7);
                }

                //empty category
                if(categories.isEmpty){
                  return Text('Categories not found');
                }

                //data found
                return SizedBox(
                  height: 80,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(width: ASizes.spaceBtwItems),
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length, //item add
                    itemBuilder: (context, index) {
                      CategoryModel category = categories[index];
                      return AVerticalImageText(
                        title: category.name,
                        image: category.image,
                        textColor: AColors.white,
                        onTap: () => Get.to(() => SubCategoryScreen()),
                      );
                    },
                  ),
                );
              }
          )
        ],
      ),
    );
  }
}
