import 'dart:io';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:e_commerce/common/widgets/images/rounded_image.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/features/admin/controllers/product/admin_product_controller.dart';
import 'package:e_commerce/features/shop/models/product_model.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:e_commerce/utils/validatons/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AdminAddProductScreen extends StatelessWidget {
  const AdminAddProductScreen({super.key, this.product});

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    // Controller for handling form logic (separate or here for simplicity)
    // For now, I'll put basic logic here or reuse main controller if suitable,
    // but better to have a separate CreateProductController.
    // I will use a simple stateful widget/logic for now to keep it contained
    // or quickly create a controller below.
    final controller = Get.put(AdminProductController());
    final formKey = GlobalKey<FormState>();

    // Initialize logic (Simple reset if new, set if edit)
    // Note: In a real app, use a dedicated controller or onInit.
    // Here we do a quick check to prevent overwriting on rebuilds if possible,
    // but since we reuse the controller, we should be careful.
    // Ideally: controller.initForProduct(product);
    // Initialize logic
    if (product != null) {
      // Init Category
      if (controller.selectedCategory.value == null) {
        final foundCategory = controller.categoryList
            .firstWhereOrNull((c) => c.id == product?.categoryId);
        if (foundCategory != null)
          controller.selectedCategory.value = foundCategory;
      }

      // Init Brand
      if (controller.selectedBrand.value == null && product!.brand != null) {
        final foundBrand = controller.brandList
            .firstWhereOrNull((b) => b.id == product!.brand!.id);
        if (foundBrand != null) controller.selectedBrand.value = foundBrand;
      }
    }

    // Text Controllers
    final titleController = TextEditingController(text: product?.title ?? '');
    final priceController =
        TextEditingController(text: product?.price.toString() ?? '');
    final stockController =
        TextEditingController(text: product?.stock.toString() ?? '');
    final salePriceController =
        TextEditingController(text: product?.salePrice.toString() ?? '');
    final descriptionController =
        TextEditingController(text: product?.description ?? '');

    return Scaffold(
      appBar:
          AppBar(title: Text(product == null ? 'Add Product' : 'Edit Product')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(ASizes.defaultSpace),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                // Image Picker
                Obx(() {
                  final image = controller.selectedImage.value;
                  final existingImage = product?.thumbnail ?? '';
                  return GestureDetector(
                    onTap: controller.pickImage,
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius:
                            BorderRadius.circular(ASizes.cardRadiusLg),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: image != null
                          ? ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(ASizes.cardRadiusLg),
                              child: kIsWeb
                                  ? Image.network(image.path, fit: BoxFit.cover)
                                  : Image.file(File(image.path),
                                      fit: BoxFit.cover),
                            )
                          : existingImage.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      ASizes.cardRadiusLg),
                                  child: ARoundedImage(
                                      imageUrl: existingImage,
                                      isNetworkImage: true,
                                      applyImageRadius: false))
                              : const Icon(Iconsax.image,
                                  size: 50, color: Colors.grey),
                    ),
                  );
                }),
                const SizedBox(height: ASizes.spaceBtwSections),

                // Title
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                      labelText: 'Product Title',
                      prefixIcon: Icon(Iconsax.box)),
                  validator: (value) =>
                      AValidator.validateEmptyText('Title', value),
                ),
                const SizedBox(height: ASizes.spaceBtwInputFields),

                // Category Dropdown
                Obx(() {
                  return DropdownButtonFormField<CategoryModel>(
                    decoration: const InputDecoration(
                        labelText: 'Category',
                        prefixIcon: Icon(Iconsax.category)),
                    value: controller.selectedCategory.value,
                    items: controller.categoryList.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.selectedCategory.value = value;
                    },
                    validator: (value) =>
                        value == null ? 'Category is required' : null,
                  );
                }),
                const SizedBox(height: ASizes.spaceBtwInputFields),

                // Price & Sale Price
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: priceController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'Price',
                            prefixIcon: Icon(Iconsax.money)),
                        validator: (value) =>
                            AValidator.validateEmptyText('Price', value),
                      ),
                    ),
                    const SizedBox(width: ASizes.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                        controller: salePriceController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                            labelText: 'Sale Price',
                            prefixIcon: Icon(Iconsax.discount_shape)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: ASizes.spaceBtwInputFields),

                // Stock
                TextFormField(
                  controller: stockController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'Stock', prefixIcon: Icon(Iconsax.sort)),
                  validator: (value) =>
                      AValidator.validateEmptyText('Stock', value),
                ),
                const SizedBox(height: ASizes.spaceBtwInputFields),

                // Brand Dropdown
                Obx(() {
                  return DropdownButtonFormField<BrandModel>(
                    decoration: const InputDecoration(
                        labelText: 'Brand', prefixIcon: Icon(Iconsax.medal)),
                    value: controller.selectedBrand.value,
                    items: controller.brandList.map((brand) {
                      return DropdownMenuItem(
                        value: brand,
                        child: Text(brand.name),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.selectedBrand.value = value;
                    },
                    validator: (value) =>
                        value == null ? 'Brand is required' : null,
                  );
                }),
                const SizedBox(height: ASizes.spaceBtwInputFields),

                // Description
                TextFormField(
                  controller: descriptionController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                      labelText: 'Description', prefixIcon: Icon(Iconsax.note)),
                ),
                const SizedBox(height: ASizes.spaceBtwSections),

                // Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (!formKey.currentState!.validate()) return;

                      final newProduct = ProductModel(
                        id: product?.id ?? '',
                        title: titleController.text.trim(),
                        stock: int.tryParse(stockController.text.trim()) ?? 0,
                        price:
                            double.tryParse(priceController.text.trim()) ?? 0.0,
                        salePrice:
                            double.tryParse(salePriceController.text.trim()) ??
                                0.0,
                        thumbnail:
                            product?.thumbnail ?? '', // Keep existing or empty
                        description: descriptionController.text.trim(),
                        productType: 'ProductType.single',
                        // Note: Brand handling is simplified here. Ideally fetch BrandModel.
                      );

                      controller.saveProduct(newProduct);
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
