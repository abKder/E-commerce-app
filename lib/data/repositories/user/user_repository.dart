import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../features/authentication/models/user_model.dart';
import '../../../utils/constants/keys.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  //variable
final _db = FirebaseFirestore.instance;

Future<void> saveUserRecord(UserModel user) async{
  try{
    await _db.collection(AKeys.userCollection).doc(user.id).set(user.toJson());
  }on FirebaseAuthException catch (e) {
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
}