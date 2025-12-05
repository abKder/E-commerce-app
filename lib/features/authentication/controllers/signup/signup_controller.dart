import 'package:e_commerce/data/repositories/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

//variables
  final signupFormKey = GlobalKey<FormState>();
  final _authRepository = Get.put(AuthenticationRepository());
  RxBool isPasswordVisible = false.obs;
  RxBool privacyPolicy = false.obs;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  Future<void> registerUser() async {
    try {

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        return;
      }

      //register user
      UserCredential user = await _authRepository.registerUser(email.text.trim(), password.text.trim());
    } catch (e) {}
  }
}
