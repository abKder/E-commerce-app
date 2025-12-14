import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/services/cloudinary_services.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ProductRepository extends GetxController{
  static ProductRepository get to => Get.find();

  //variable
final _db = FirebaseFirestore.instance;
final _cloudinaryServices = Get.put(CloudinaryServices());

//upload product
Future<void> uploadProducts(List<ProductModel> products) async{
  try{



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