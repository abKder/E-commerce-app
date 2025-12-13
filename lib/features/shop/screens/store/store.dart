import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/controllers/brand/brand_controller.dart';
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
    return DefaultTabController(
        length: 7,
        child:Scaffold(
      body: NestedScrollView(
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
                          ASectionHeading(title: 'Brand', onPressed: () => Get.to(() => BrandScreen())),

                          //brand card
                          SizedBox(
                            height: ASizes.brandCardHeight,
                            child: Obx(
                                (){
                                  if(brandController.isLoading.value){
                                    return ABrandsShimmer();
                                  }

                                  if(brandController.featuredBrands.isEmpty){
                                    return Text('Brands not found');
                                  }

                                  return ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          SizedBox(width: ASizes.spaceBtwItems),
                                      shrinkWrap: true,
                                      itemCount: brandController.featuredBrands.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        BrandModel brand = brandController.featuredBrands[index];
                                        return SizedBox(width: ASizes.brandCardWidth, child: ABrandCard(brand: brand));
                                      } );
                                }
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),



              bottom: ATapBar(tabs: [
                Tab(child: Text('Food')),
                Tab(child: Text('Kitchen Utils')),
                Tab(child: Text('Fashion')),
                Tab(child: Text('Skin Care')),
                Tab(child: Text('Electronics')),
                Tab(child: Text('Stationary')),
                Tab(child: Text('Toys')),
              ]),
            )
          ];
        },
        body:  TabBarView(
                  children: [
                    ACategoryTab(),
                    ACategoryTab(),
                    ACategoryTab(),
                    ACategoryTab(),
                    ACategoryTab(),
                    ACategoryTab(),
                    ACategoryTab(),
                  ]),
      ),
    ));
  }
}