import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import '../../../utils/constants/keys.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/cloudinary_services.dart';

class BrandRepository extends GetxController{
  static BrandRepository get instance => Get.find();


  //variable
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

//upload brand
  Future<void> uploadBrands(List<BrandModel> brands) async {
    try {
      for (var brand in brands) {
// Skip if already a network URL
        if (brand.image.startsWith('http')) {
          await _db.collection('Brands').doc().set(brand.toJson());
          continue;
        }

// Web-compatible: Load asset bytes
        final byteData = await rootBundle.load(brand.image);
        final bytes = byteData.buffer.asUint8List();
        final image = XFile.fromData(bytes, name: brand.image.split('/').last); // Create XFile from bytes

        dio.Response response = await _cloudinaryServices.uploadImage(image, AKeys.brandsFolder);

        if (response.statusCode == 200) {
          brand.image = response.data['url'];
        }

        await _db.collection("Brands").doc().set(brand.toJson());
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

//fetch brand
  Future<List<BrandModel>> fetchActiveBrands() async{
    try{

      final query = await _db.collection("Brands").where('isFeatured', isEqualTo: true).get();

      if(query.docs.isNotEmpty){
        List<BrandModel> brands = query.docs.map((document) => BrandModel.fromSnapshot(document)).toList();
        return brands;
      }
      return [];

    }  on FirebaseException catch (e) {
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