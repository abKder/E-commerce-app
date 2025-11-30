import 'package:e_commerce/features/shop/screens/product_details/widgets/product_attribute.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce/features/shop/screens/product_details/widgets/product_thumbnail_and_slider.dart';
import 'package:e_commerce/utils/helpers/helperFunction.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = AHelperFunctions.inDarkMode(context);
    return Scaffold(
      //body
      body: SingleChildScrollView(
        child: Column(
          children: [
            //product image and slider
            AProductThumbnailAndSlider(dark: dark),

            //Product details

            //price title Stock and brand
            AProductMetaData(),

            //attribute
            AProductAttributes(),

            //checkout button

            //description
          ],
        ),
      ),

      //bottom navigation
    );
  }
}


