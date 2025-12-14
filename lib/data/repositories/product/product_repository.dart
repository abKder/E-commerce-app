import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/services/cloudinary_services.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
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
    try {
      for (ProductModel product in products) {
        // upload thumbnail to cloudinary
        if (product.thumbnail.isNotEmpty &&
            !product.thumbnail.startsWith('http')) {
          final byteData = await rootBundle.load(product.thumbnail);
          final bytes = byteData.buffer.asUint8List();
          final image = XFile.fromData(bytes,
              name:
                  product.thumbnail.split('/').last); // Create XFile from bytes

          dio.Response response =
              await _cloudinaryServices.uploadImage(image, 'Product Images');

          if (response.statusCode == 200 &&
              response.data != null &&
              response.data['url'] != null) {
            product.thumbnail = response.data['url'];
          }
        }

        // upload variation images
        if (product.productVariations != null &&
            product.productVariations!.isNotEmpty) {
          for (var variation in product.productVariations!) {
            if (variation.image.isNotEmpty &&
                !variation.image.startsWith('http')) {
              print("Nested images are uploading...");
              final byteData = await rootBundle.load(variation.image);
              final bytes = byteData.buffer.asUint8List();
              final image = XFile.fromData(bytes,
                  name: variation.image
                      .split('/')
                      .last); // Create XFile from bytes

              dio.Response response = await _cloudinaryServices.uploadImage(
                  image, 'Product Images');

              if (response.statusCode == 200 &&
                  response.data != null &&
                  response.data['url'] != null) {
                variation.image = response.data['url'];
                print('Uploaded variation image: ${variation.image}');
              } else {
                print(
                    'Failed to upload variation image. Status: ${response.statusCode}, Data: ${response.data}');
              }
            }
          }
        }

        await _db.collection('Products').doc(product.id).set(product.toJson());
        print('Successfully uploaded product: ${product.title}');
      }
      print('All products uploaded successfully!');
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

  /// Get All Products
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final snapshot = await _db.collection('Products').get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw AFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw APlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Delete Product
  Future<void> deleteProduct(String id) async {
    try {
      await _db.collection('Products').doc(id).delete();
    } on FirebaseException catch (e) {
      throw AFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw APlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Save Product Data (Create or Update)
  Future<void> saveProductRecord(ProductModel product) async {
    try {
      if (product.id.isEmpty) {
        // Create new document reference to get ID
        final docRef = _db.collection('Products').doc();
        product.id = docRef.id;
        await docRef.set(product.toJson());
      } else {
        // Update existing document
      }
    } on FirebaseException catch (e) {
      throw AFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw APlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get Products for Favorites
  Future<List<ProductModel>> getFavouriteProducts(
      List<String> productIds) async {
    try {
      if (productIds.isEmpty) return [];

      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      return snapshot.docs
          .map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw AFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw APlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
