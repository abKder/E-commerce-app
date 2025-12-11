import 'dart:convert';
import 'dart:io';
import 'package:crypto/crypto.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart' as dio;
import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:e_commerce/utils/constants/apis.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/authentication/models/user_model.dart';
import '../../../utils/constants/keys.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  //variable
  final _db = FirebaseFirestore.instance;

//store user data
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db
          .collection(AKeys.userCollection)
          .doc(user.id)
          .set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw AFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw AFormatException();
    } on PlatformException catch (e) {
      throw APlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

// user model fetch user details current user
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection(AKeys.userCollection)
          .doc(AuthenticationRepository.instance.currentUser!.uid)
          .get();
      if (documentSnapshot.exists) {
        UserModel user = UserModel.fromSnapshot(documentSnapshot);
        return user;
      }

      return UserModel.empty();
    } on FirebaseAuthException catch (e) {
      throw AFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw AFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw AFormatException();
    } on PlatformException catch (e) {
      throw APlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  // Update any field in specific Users collection
  Future<void> updateSingleField(Map<String, dynamic> map) async {
    try {
      await _db
          .collection(AKeys.userCollection)
          .doc(AuthenticationRepository.instance.currentUser!.uid)
          .update(map);
    } on FirebaseException catch (e) {
      throw AFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AFormatException();
    } on PlatformException catch (e) {
      throw APlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  //delete user
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection(AKeys.userCollection).doc(userId).delete();
    } on FirebaseException catch (e) {
      throw AFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AFormatException();
    } on PlatformException catch (e) {
      throw APlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  Future<dio.Response> uploadImage(XFile image) async {
    try {
      String api = AApiUrls.uploadApi(AKeys.cloudName);
      final bytes = await image.readAsBytes();
      dio.FormData formData = dio.FormData.fromMap({
        'upload_preset': AKeys.uploadPreset,
        'folder': AKeys.profileFolder,
        'file': dio.MultipartFile.fromBytes(bytes,
            filename: image.path.split('/').last)
      });

      dio.Response response = await dio.Dio().post(api, data: formData);
      return response;
    } on dio.DioException catch (e) {
      throw 'Dio Error: ${e.message}, Response: ${e.response?.data}';
    } catch (e) {
      throw 'Something went wrong: $e';
    }
  }

  //delete profile picture
  Future<dio.Response> deleteProfilePicture(String publicId) async {
    try {
      String api = AApiUrls.deleteApi(AKeys.cloudName);
      int timestamp = (DateTime.now().millisecondsSinceEpoch / 1000).round();
      String signatureBase =
          'public_id=$publicId&timestamp=$timestamp${AKeys.apiSecret}';
      String signature = sha1.convert(utf8.encode(signatureBase)).toString();

      dio.FormData formData = dio.FormData.fromMap({
        'public_id': publicId,
        'api_key': AKeys.apiKey,
        'timestamp': timestamp,
        'signature': signature,
      });

      dio.Response response = await dio.Dio().post(api, data: formData);
      return response;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
