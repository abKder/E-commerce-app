import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_commerce/data/services/cloudinary_services.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/shop/models/banners_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import 'package:dio/dio.dart' as dio;

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  //variable
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

  Future<void> uploadBanners(List<BannerModel> banners) async {
    try {
      for (var banner in banners) {
// Skip if already a network URL
        if (banner.imageUrl.startsWith('http')) {
          await _db.collection('Banners').doc().set(banner.toJson());
          continue;
        }

// Web-compatible: Load asset bytes
        final byteData = await rootBundle.load(banner.imageUrl);
        final bytes = byteData.buffer.asUint8List();
        final image = XFile.fromData(bytes, name: banner.imageUrl.split('/').last); // Create XFile from bytes

        dio.Response response = await _cloudinaryServices.uploadImage(image, AKeys.bannersFolder);

        if (response.statusCode == 200) {
          banner.imageUrl = response.data['url'];
        }

        await _db.collection("Banners").doc().set(banner.toJson());
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

  /// Get all order related to current user
  Future<List<BannerModel>> fetchActiveBanners() async{
    try{

      final query = await _db.collection(AKeys.bannerCollection).where('active', isEqualTo: true).get();
      
      if(query.docs.isNotEmpty){
        List<BannerModel> banners = query.docs.map((document) => BannerModel.fromDocument(document)).toList();
        return banners;
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
