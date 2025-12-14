import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/admin/controllers/category/admin_category_controller.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CreateCategoryScreen extends StatelessWidget {
  const CreateCategoryScreen({super.key, this.category});

  final CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdminCategoryController>();

    // Initialize form
    controller.init(category);

    return Scaffold(
      appBar: AAppBar(
        title: Text(category == null ? 'Create Category' : 'Edit Category',
            style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Column(
            children: [
              /// Name
              TextFormField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                    labelText: 'Category Name',
                    prefixIcon: Icon(Iconsax.category)),
              ),
              const SizedBox(height: ASizes.spaceBtwInputFields),

              /// Featured Checkbox
              Obx(() => CheckboxListTile(
                    title: const Text('Featured Category'),
                    value: controller.isFeaturedReference.value,
                    onChanged: (value) =>
                        controller.isFeaturedReference.value = value ?? false,
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                  )),

              const SizedBox(height: ASizes.spaceBtwSections),

              /// Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.saveCategory(category),
                    child: const Text('Save')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
