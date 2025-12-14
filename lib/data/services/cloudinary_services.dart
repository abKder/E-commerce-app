import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import '../../utils/constants/apis.dart';
import '../../utils/constants/keys.dart';
import 'package:image_picker/image_picker.dart';

class CloudinaryServices extends GetxController {
  static CloudinaryServices get instance => Get.find();

  /// Variables
  final _dio = dio.Dio();

  /// [UploadImage] - Function to upload Image
  Future<dio.Response> uploadImage(XFile image, String folderName) async {

    print('hit.. product Image');
    try {
      String api = AApiUrls.uploadApi(AKeys.cloudName);

      // Using dio directly with bytes for Web compatibility
      final formData = dio.FormData.fromMap({
        'upload_preset': AKeys.uploadPreset,
        'folder': folderName,
        'file': dio.MultipartFile.fromBytes(await image.readAsBytes(),
            filename: image.name)
      });

      dio.Response response = await _dio.post(api, data: formData);
      return response;
    } catch (e) {
      throw 'Failed to upload profile picture. Please try again. Details: $e';
    }
  }

  /// [DeleteImage] - Function to delete Image
  Future<dio.Response> deleteImage(String publicId) async {
    try {
      String api = AApiUrls.deleteApi(AKeys.cloudName);

      int timestamp = (DateTime.now().millisecondsSinceEpoch / 1000).round();

      String signatureBase =
          'public_id=$publicId&timestamp=$timestamp${AKeys.apiSecret}';
      String signature = sha1.convert(utf8.encode(signatureBase)).toString();

      final formData = dio.FormData.fromMap({
        'public_id': publicId,
        'api_key': AKeys.apiKey,
        'timestamp': timestamp,
        'signature': signature
      });

      dio.Response response = await _dio.post(api, data: formData);

      return response;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
