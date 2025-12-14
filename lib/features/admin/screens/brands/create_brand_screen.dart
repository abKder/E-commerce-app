import 'dart:io';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/admin/controllers/brand/admin_brand_controller.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CreateBrandScreen extends StatelessWidget {
  const CreateBrandScreen({super.key, this.brand});

  final BrandModel? brand;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdminBrandController>();
    controller.init(brand);

    return Scaffold(
      appBar: AAppBar(
        title: Text(brand == null ? 'Create Brand' : 'Edit Brand',
            style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Column(
            children: [
              /// Image Picker
              GestureDetector(
                onTap: controller.pickImage,
                child: Obx(() {
                  final pickedImage = controller.pickedImage.value;
                  return Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius:
                          BorderRadius.circular(100), // Circular for brands
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    child: pickedImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: kIsWeb
                                ? Image.network(pickedImage.path,
                                    fit: BoxFit.cover)
                                : Image.file(File(pickedImage.path),
                                    fit: BoxFit.cover))
                        : (brand != null && brand!.image.isNotEmpty)
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(brand!.image,
                                    fit: BoxFit.cover))
                            : const Icon(Iconsax.image,
                                size: 50, color: Colors.grey),
                  );
                }),
              ),
              const SizedBox(height: ASizes.spaceBtwInputFields),
              Text('Tap to select image',
                  style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: ASizes.spaceBtwSections),

              /// Name
              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                    labelText: 'Brand Name', prefixIcon: Icon(Iconsax.tag)),
              ),
              const SizedBox(height: ASizes.spaceBtwInputFields),

              /// Featured Checkbox
              Obx(() => CheckboxListTile(
                    title: const Text('Is Featured'),
                    value: controller.isFeatured.value,
                    onChanged: (value) =>
                        controller.isFeatured.value = value ?? false,
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                  )),

              const SizedBox(height: ASizes.spaceBtwSections),

              /// Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.saveBrand(brand),
                    child: const Text('Save')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
