import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/brands/brand_card.dart';
import 'package:e_commerce/common/widgets/layouts/grid_layout.dart';
import 'package:e_commerce/common/widgets/texts/section_heading.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/brand/brand_controller.dart';
import 'brand_products.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: AAppBar(
          showBackArrow: true,
          title:
              Text('Brand', style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: APadding.screenPadding,
          child: Column(
            children: [
              ASectionHeading(title: 'Brands', showActionButton: false),
              SizedBox(height: ASizes.spaceBtwItems),
              Obx(() {

                if(controller.isLoading.value){
                  return CircularProgressIndicator();
                }

                if(controller.allBrands.isEmpty){
                  return Center(child:  Text('Brands not found!'));
                }
                return AGridLayout(
                    itemCount: controller.allBrands.length,
                    itemBuilder: (context, index) {
                      BrandModel brand = controller.allBrands[index];
                      return ABrandCard(onTap: () => Get.to(() => BrandProductsScreen()), brand: brand);
                    },
                    mainAxisExtent: 88);

              })
            ],
          ),
        ),
      ),
    );
  }
}
