import 'package:e_commerce/data/repositories/brand/brand_repository.dart';
import 'package:e_commerce/features/shop/models/brand_model.dart';
import 'package:get/get.dart';

import '../../../../utils/popups/snackbar_helpers.dart';

class BrandController extends GetxController{
  static BrandController get instance => Get.find();

  //variable
  final _repository = Get.put(BrandRepository());
  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getBrands();
    super.onInit();
  }

Future<void> getBrands() async{
    try{

      isLoading.value = true;

      List<BrandModel> allBrands = await _repository.fetchActiveBrands();

      this.allBrands.assignAll(allBrands);

      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).toList());

    }catch(e){
      ASnackBarHelpers.errorSnackBar(title: 'Failed', message: e.toString());
    }finally{
      isLoading.value = false;
    }
}

}