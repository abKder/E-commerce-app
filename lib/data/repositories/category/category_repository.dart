import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/utils/constants/keys.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';
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

  //category upload
  Future<void> uploadCategories(List<CategoryModel> categories) async {
    bool hasError = false;
    String errorMessage = '';

    for (final category in categories) {
      try {
        // Skip upload if image is already a network URL (assuming http/https)
        if (category.image.startsWith('http')) {
          await _db
              .collection(AKeys.categoryCollection)
              .doc(category.id)
              .set(category.toJson());
          continue;
        }

        final file = await AHelperFunctions.assetToFile(category.image);
        final response =
            await _cloudinaryServices.uploadImage(file, AKeys.categoryFolder);

        if (response.statusCode == 200) {
          category.image = response.data['url'];
          await _db
              .collection(AKeys.categoryCollection)
              .doc(category.id)
              .set(category.toJson());
        } else {
          hasError = true;
          errorMessage =
              'Failed to upload ${category.name}. Status: ${response.statusCode}';
        }
      } on FirebaseException catch (e) {
        hasError = true;
        errorMessage = AFirebaseException(e.code).message;
      } on FormatException catch (_) {
        hasError = true;
        errorMessage = AFormatException().message;
      } on PlatformException catch (e) {
        hasError = true;
        errorMessage = APlatformException(e.code).message;
      } catch (e) {
        hasError = true;
        errorMessage = e.toString();
      }
    }

    if (hasError) {
      throw errorMessage.isNotEmpty
          ? errorMessage
          : 'One or more categories failed to upload.';
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
