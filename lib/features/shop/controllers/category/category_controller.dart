import 'package:e_commerce/data/repositories/category/category_repository.dart';
import 'package:e_commerce/features/shop/models/category_model.dart';
import 'package:e_commerce/utils/popups/snackbar_helpers.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get find => Get.find();

  //variable
  final _repository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  RxBool isCategoriesLoading = false.obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();

  }

  //fetch all category from firebase
  Future<void> fetchCategories() async {
    try {
      //start loading
      isCategoriesLoading.value = true;

      //fetcher category
      List<CategoryModel> categories = await _repository.getAllCategories();
      featuredCategories.assignAll(categories);
      // featuredCategories.assignAll(categories.where(
      //     (category) => category.isFeatured && category.parentId.isEmpty));
    } catch (e) {
      ASnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
    } finally {
      isCategoriesLoading.value = false;
    }
  }
}
