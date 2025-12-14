import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/services/cloudinary_services.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import 'package:dio/dio.dart' as dio;

class ProductRepository extends GetxController {
  static ProductRepository get to => Get.find();

  //variable
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

//upload product
  Future<void> uploadProducts(List<ProductModel> products) async {
    List<String> imageUrls = [];

    try {
      for (ProductModel product in products) {
        print("hit for image Upload!");
        //upload thumbnail to cloudinary
        if (product.thumbnail.startsWith('http')) {
          await _db.collection('Product Images').doc().set(product.toJson());
          continue;
        }

// Web-compatible: Load asset bytes
        final byteData = await rootBundle.load(product.thumbnail);
        final bytes = byteData.buffer.asUint8List();
        final image = XFile.fromData(bytes, name: product.thumbnail.split('/').last); // Create XFile from bytes

        dio.Response response = await _cloudinaryServices.uploadImage(image, 'Product Images');
        if(product.productVariations!.isNotEmpty  ) {
          product.productVariations?.forEach((i) async {
            if (i.image.isEmpty || i.image == "") {
              final byteData = await rootBundle.load(i.image);
              final bytes = byteData.buffer.asUint8List();
              final image = XFile.fromData(bytes, name: i.image
                  .split('/')
                  .last); // Create XFile from bytes

              dio.Response response = await _cloudinaryServices.uploadImage(
                  image, 'Product Images');


              if (response.statusCode == 200) {
                print("nested image upload,...");
                imageUrls.add(response.data['url']);
              }
            }
          });


          for (final variation in product.productVariations!) {
            int index =
            product.images!.indexWhere((image) => image == variation.image);
            variation.image = imageUrls[index];
          }

        }

        if (response.statusCode == 200) {
          print("hit...response");
          product.thumbnail = response.data['url'];
        }




        print('Hit... line 36');

        // if (product.productVariations != null && product.productVariations!.isNotEmpty) {
        //
        //
        //   //image upload
        //   // for (String i in product.productVariations.!) {
        //   //   final byteData = await rootBundle.load(i);
        //   //   final bytes = byteData.buffer.asUint8List();
        //   //   final image = XFile.fromData(bytes, name: i.split('/').last); // Create XFile from bytes
        //   //
        //   //   dio.Response response = await _cloudinaryServices.uploadImage(image, 'Product Images');
        //   //
        //   //
        //   //   if (response.statusCode == 200) {
        //   //     print("nested image upload,...");
        //   //     imageUrls.add(response.data['url']);
        //   //   }
        //   // }
        //
        //
        //   //update product variation
        //
        // }


        print('Hit... line 64');
        await _db
            .collection('Products')
            .doc(product.id)
            .set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw AFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw AFormatException();
    } on PlatformException catch (e) {
      throw APlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again. Details: $e';
    }
  }
}
