import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/controllers/brand/brand_controller.dart';
import 'package:e_commerce/features/shop/controllers/category/category_controller.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:e_commerce/features/shop/screens/store/widgets/store_primary_header.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/shimmer/brands_shimmer.dart';
import '../brands/all_brands.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categoryController = Get.put(CategoryController());

    return Scaffold(
      body: Obx(() {
        if (categoryController.isCategoriesLoading.value)
          return const Center(child: CircularProgressIndicator());

        final categories = categoryController.featuredCategories;
        if (categories.isEmpty)
          return const Center(child: Text("No Categories Found"));

        return DefaultTabController(
            length: categories.length,
            child: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: 350,
                    pinned: true,
                    floating: false,
                    flexibleSpace: SingleChildScrollView(
                      child: Column(
                        children: [
                          //primary header
                          AStorePrimaryHeader(),
                          SizedBox(height: ASizes.spaceBtwItems),

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: ASizes.defaultSpace),
                            child: Column(
                              children: [
                                //brand heading
                                ASectionHeading(
                                    title: 'Brand',
                                    onPressed: () =>
                                        Get.to(() => BrandScreen())),

                                //brand card
                                SizedBox(
                                  height: ASizes.brandCardHeight,
                                  child: Obx(() {
                                    if (brandController.isLoading.value) {
                                      return ABrandsShimmer();
                                    }

                                    if (brandController
                                        .featuredBrands.isEmpty) {
                                      return Text('Brands not found');
                                    }

                                    return ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                                width: ASizes.spaceBtwItems),
                                        shrinkWrap: true,
                                        itemCount: brandController
                                            .featuredBrands.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          BrandModel brand = brandController
                                              .featuredBrands[index];
                                          return SizedBox(
                                              width: ASizes.brandCardWidth,
                                              child: ABrandCard(brand: brand));
                                        });
                                  }),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    bottom: ATapBar(
                        tabs: categories
                            .map((category) => Tab(child: Text(category.name)))
                            .toList()),
                  )
                ];
              },
              body: TabBarView(
                children: categories
                    .map((category) => ACategoryTab(category: category))
                    .toList(),
              ),
            ));
      }),
    );
  }
}
