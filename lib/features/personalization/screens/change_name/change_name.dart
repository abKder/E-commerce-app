import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/constants/texts.dart';
import 'package:e_commerce/utils/validatons/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/change_name_controller.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
   final controller =  Get.put(ChangeNameController());
    return Scaffold(

      //app bar
      appBar: AAppBar(
          showBackArrow: true,
          title: Text('Update Name',
              style: Theme.of(context).textTheme.headlineSmall)),

      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: APadding.screenPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              //heading
              Text('Update your name to keep your profile accurate and personalized', style: Theme.of(context).textTheme.labelMedium),
              SizedBox(height: ASizes.spaceBtwSections),

              //form
              Form(
                key: controller.updateUserNameFormKey,
                  child: Column(
                children: [
                  //first name
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => AValidator.validateEmptyText('First Name', value),
                    decoration: InputDecoration(labelText: ATexts.firstName, prefixIcon: Icon(Iconsax.user)),
                  ),
                  SizedBox(height: ASizes.spaceBtwInputFields),

                  //last name
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => AValidator.validateEmptyText('Last Name', value),
                    decoration: InputDecoration(labelText: ATexts.lastName, prefixIcon: Icon(Iconsax.user)),
                  )
                ],
              )),
              
              SizedBox(height: ASizes.spaceBtwSections),
              
              //save button
              AElevatedButton(onPressed: controller.updateUserName, child:Text('Save'))
            ],
          ),

        ),
      ),
    );
  }
}
