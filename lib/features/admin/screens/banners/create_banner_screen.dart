import 'dart:io';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:e_commerce/common/widgets/appbar/appbar.dart';
import 'package:e_commerce/features/admin/controllers/banner/admin_banner_controller.dart';
import 'package:e_commerce/features/shop/models/banners_model.dart';
import 'package:e_commerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CreateBannerScreen extends StatelessWidget {
  const CreateBannerScreen({super.key, this.banner});

  final BannerModel? banner;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AdminBannerController>();
    controller.init(banner);

    return Scaffold(
      appBar: AAppBar(
        title: Text(banner == null ? 'Create Banner' : 'Edit Banner',
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
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(ASizes.cardRadiusLg),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    child: pickedImage != null
                        ? ClipRRect(
                            borderRadius:
                                BorderRadius.circular(ASizes.cardRadiusLg),
                            child: kIsWeb
                                ? Image.network(pickedImage.path,
                                    fit: BoxFit.cover)
                                : Image.file(File(pickedImage.path),
                                    fit: BoxFit.cover))
                        // NOTE: For Web compability using network/path differently?
                        // Actually for XFile on mobile Image.file(File(path)) is needed.
                        // On web, Image.network(path) works for XFile? No.
                        // Flutter XFile on web: use Image.network(pickedImage.path) NO.
                        // We need cross platform image provider.
                        // Simplest XFile util: kIsWeb check.
                        // Let's try simple Image.network(path) for now if we assume mostly mobile or check platform.
                        // Wait, XFile.path on mobile is a file path.
                        // Let's use a conditional or just use Image.file(File(path)) and assume mobile for now, or handle web if requested. user said "app" usually implies mobile.
                        // Safest: use AImageHelper? No.
                        // Let's import 'dart:io' for File and use Image.file.
                        : (banner != null && banner!.imageUrl.isNotEmpty)
                            ? ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(ASizes.cardRadiusLg),
                                child: Image.network(banner!.imageUrl,
                                    fit: BoxFit.cover))
                            : const Center(
                                child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(Iconsax.image,
                                      size: 50, color: Colors.grey),
                                  Text('Select Banner Image')
                                ],
                              )),
                  );
                }),
              ),
              const SizedBox(height: ASizes.spaceBtwInputFields),

              /// Target Screen
              TextFormField(
                controller: controller.targetScreenController,
                decoration: const InputDecoration(
                    labelText: 'Target Screen (e.g. /cart)',
                    prefixIcon: Icon(Iconsax.link)),
              ),
              const SizedBox(height: ASizes.spaceBtwInputFields),

              /// Active Checkbox
              Obx(() => CheckboxListTile(
                    title: const Text('Is Active'),
                    value: controller.isActive.value,
                    onChanged: (value) =>
                        controller.isActive.value = value ?? false,
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                  )),

              const SizedBox(height: ASizes.spaceBtwSections),

              /// Save Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.saveBanner(banner),
                    child: const Text('Save')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
