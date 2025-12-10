import 'package:e_commerce/features/personalization/controllers/user_controller.dart';
import 'package:e_commerce/navigation_menu.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

class ChangeNameController extends GetxController {
  static ChangeNameController get instance => Get.find();

  /// Variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = UserRepository.instance;
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();


  /// Init user data when when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }


  /// Fetch user record
  Future<void> initializeNames() async{
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }


  Future<void> updateUserName() async{
    try{

      // Start Loading
      AFullScreenLoader.openLoadingDialog('We are updating your information...');


      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        AFullScreenLoader.stopLoading();
        return;
      }


      // Form Validation
      if(!updateUserNameFormKey.currentState!.validate()){
        AFullScreenLoader.stopLoading();
        return;
      }


      // Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text;
      userController.user.value.lastName = lastName.text;


      // Remove Loading
      AFullScreenLoader.stopLoading();


      //redirect
      Get.offAll(() => NavigationMenu());

      // Show Success Message
      ASnackBarHelpers.successSnackBar(title: 'Congratulations', message: 'Your name has been updated');

    }catch(e){
      // Stop Loading
      AFullScreenLoader.stopLoading();
      // Show Error message
      ASnackBarHelpers.errorSnackBar(title: 'Update Name failed!', message: e.toString());
    }
  }

}