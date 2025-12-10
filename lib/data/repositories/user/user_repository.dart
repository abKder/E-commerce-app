import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/data/repositories/authentication_repository.dart';
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


//store user data
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


// user model fetch user details current user
Future<UserModel> fetchUserDetails() async{
  try{

   final documentSnapshot = await _db.collection(AKeys.userCollection).doc(AuthenticationRepository.instance.currentUser!.uid).get();
   if(documentSnapshot.exists){
     UserModel user = UserModel.fromSnapshot(documentSnapshot);
     return user;
   }

   return UserModel.empty();

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


  // Update any field in specific Users collection
  Future<void> updateSingleField(Map<String, dynamic> map) async{
    try{
      await _db.collection(AKeys.userCollection).doc(AuthenticationRepository.instance.currentUser!.uid).update(map);
    } on FirebaseException catch(e){
      throw AFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw const AFormatException();
    } on PlatformException catch(e){
      throw APlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


  //delete user
  Future<void> removeUserRecord(String userId) async{
    try{
      await _db.collection(AKeys.userCollection).doc(userId).delete();
    } on FirebaseException catch(e){
      throw AFirebaseException(e.code).message;
    } on FormatException catch(_){
      throw const AFormatException();
    } on PlatformException catch(e){
      throw APlatformException(e.code).message;
    } catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
}