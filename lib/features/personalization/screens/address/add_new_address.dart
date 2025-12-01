import 'package:e_commerce/common/styles/padding.dart';
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/common/widgets/button/elevated_button.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //appbar
      appBar: AAppBar(
        showBackArrow: true,
        title: Text('Add New Address', style: Theme.of(context).textTheme.headlineMedium),
      ),

      //body

      body: SingleChildScrollView(
        child: Padding(
          padding: APadding.screenPadding,
          child: Column(
            children: [
              
              //name
              TextField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.user),labelText: 'Name')),
              SizedBox(height: ASizes.spaceBtwInputFields),
              
              //phone number
              TextField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile),labelText: 'Phone Number')),
              SizedBox(height: ASizes.spaceBtwInputFields),
              //street and postal code
              Row(
                children: [

                  //street
                  Expanded(child: TextField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building_31),labelText: 'Street'))),
                  SizedBox(width: ASizes.spaceBtwSections / 2),
                  //postal code
                  Expanded(child: TextField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.code),labelText: 'Postal Code'))),
                ],
              ),
              SizedBox(height: ASizes.spaceBtwInputFields),

              Row(
                children: [

                  //city
                  Expanded(child: TextField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building),labelText: 'City'))),
                  SizedBox(width: ASizes.spaceBtwSections / 2),
                  //State
                  Expanded(child: TextField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.activity),labelText: 'State'))),
                ],
              ),
              SizedBox(height: ASizes.spaceBtwInputFields),


              //country
              TextField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.global),labelText: 'Country')),
              SizedBox(height: ASizes.spaceBtwSections),
              
              //save button
              
              AElevatedButton(onPressed: (){}, child: Text('Save'))
              
              
            ],
          ),
        ),
      ),
    );
  }
}

