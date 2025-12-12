// import 'dart:io'; // Removed for Web compatibility
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../services/cloudinary_services.dart';
import 'package:dio/dio.dart' as dio;

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;
  final _cloudinaryServices = Get.put(CloudinaryServices());

  @override
  void onInit() {
    // uploadDummyData(ADummyData.Categories);
    super.onInit();
  }

  //category upload
  Future<void> uploadCategories(List<CategoryModel> categories) async {
    try {
      for (var category in categories) {
        // Skip if already a network URL
        if (category.image.startsWith('http')) {
          await _db
              .collection(AKeys.categoryCollection)
              .doc(category.id)
              .set(category.toJson());
          continue;
        }

        // Web-compatible: Load asset bytes
        final byteData = await rootBundle.load(category.image);
        final bytes = byteData.buffer.asUint8List();
        final image = XFile.fromData(bytes,
            name: category.image.split('/').last); // Create XFile from bytes

        dio.Response response =
            await _cloudinaryServices.uploadImage(image, AKeys.categoryFolder);

        if (response.statusCode == 200) {
          category.image = response.data['url'];
        }

        await _db
            .collection(AKeys.categoryCollection)
            .doc(category.id)
            .set(category.toJson());
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

  //fetch category
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final query = await _db.collection(AKeys.categoryCollection).get();
      if (query.docs.isNotEmpty) {
        List<CategoryModel> categories = query.docs
            .map((document) => CategoryModel.fromSnapshot(document))
            .toList();
        return categories;
      }
      return [];
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
