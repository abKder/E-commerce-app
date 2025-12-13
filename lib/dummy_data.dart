import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/constants/images.dart';

import 'features/shop/models/banners_model.dart';
import 'features/shop/models/brand_model.dart';
import 'features/shop/models/category_model.dart';

class ADummyData {

  /// List of all Banners

  static final List<BannerModel> banner = [
    BannerModel(imageUrl: AImages.banner1, targetScreen: ARoutes.order, active: true),
    BannerModel(imageUrl: AImages.banner2, targetScreen: ARoutes.cart, active: true),
    BannerModel(imageUrl: AImages.banner3, targetScreen: ARoutes.wishlist, active: true),
    BannerModel(imageUrl: AImages.banner5, targetScreen: ARoutes.productDetail, active: true),
    BannerModel(imageUrl: AImages.banner5, targetScreen: ARoutes.profile, active: true),
  ];



  /// List of all Categories
  static final List<CategoryModel> categories = [
    /// Parent Categories
    /// food
    CategoryModel(id: '1', name: 'Food', image: AImages.foodIcon, isFeatured: true,
        subCategory: [
      CategoryModel(id: '8', name: 'Mongo', image: AImages.fFoodMango, parentId: '1', isFeatured: false, subCategory: []),
      CategoryModel(id: '9', name: 'Breakfast', image: AImages.fBreakfast, parentId: '1', isFeatured: false, subCategory: []),
      CategoryModel(id: '10', name: 'Fish Dessert', image: AImages.fFishDessert, parentId: '1', isFeatured: false, subCategory: [])
        ]),

    /// Kitchen utils
    CategoryModel(id: '2', name: 'Kitchen Utils', image: AImages.kitchenIcon, isFeatured: true,
        subCategory: [
      CategoryModel(id: '11', name: 'Kitchen Item', image: AImages.kitchenItem1, parentId: '2', isFeatured: false, subCategory: []),
      CategoryModel(id: '12', name: 'Kitchen Item', image: AImages.kitchenItem2, parentId: '2', isFeatured: false, subCategory: []),
        ]),

    // /// fashion
    CategoryModel(id: '3', name: 'Fashion', image: AImages.fashionIcon, isFeatured: true,
        subCategory: [
      CategoryModel(id: '13', name: 'Pant', image: AImages.fashionPant, parentId: '3', isFeatured: false, subCategory: []),
      CategoryModel(id: '14', name: 'Pant', image: AImages.fashionPant, parentId: '3', isFeatured: false, subCategory: []),
      CategoryModel(id: '15', name: 'Pant', image: AImages.fashionPant, parentId: '3', isFeatured: false, subCategory: []),
      CategoryModel(id: '16', name: 'Pant', image: AImages.fashionPant, parentId: '3', isFeatured: false, subCategory: []),
      CategoryModel(id: '17', name: 'Pant', image: AImages.fashionPant, parentId: '3', isFeatured: false, subCategory: []),
        ]),

// /// skin care
    CategoryModel(id: '4', name: 'Skin Care', image: AImages.skinIcon, isFeatured: true,
        subCategory: [
      CategoryModel(id: '18', name: 'Body', image: AImages.skinBody, parentId: '4', isFeatured: false, subCategory: []),
      CategoryModel(id: '19', name: 'Clinic', image: AImages.skinClinic, parentId: '4', isFeatured: false, subCategory: []),
      CategoryModel(id: '20', name: 'Fresh', image: AImages.skinFresh, parentId: '4', isFeatured: false, subCategory: []),
        ]),

// /// electronics
    CategoryModel(id: '5', name: 'Electronics', image: AImages.electronicsIcon, isFeatured: true,
        subCategory: [
      CategoryModel(id: '21', name: 'Watch', image: AImages.eAnalogWatch, parentId: '5', isFeatured: false, subCategory: []),
      CategoryModel(id: '22', name: 'Iphone', image: AImages.ePhone, parentId: '5', isFeatured: false, subCategory: []),
        ]),

    // /// stationary
    CategoryModel(id: '6', name: 'Stationary', image: AImages.stationaryIcon, isFeatured: true,
        subCategory: [
      CategoryModel(id: '23', name: 'Color Pen', image: AImages.stationaryColorPen, parentId: '6', isFeatured: false, subCategory: []),
      CategoryModel(id: '24', name: 'Daba', image: AImages.stationaryDaba, parentId: '6', isFeatured: false, subCategory: []),
      CategoryModel(id: '25', name: 'Kokbat', image: AImages.stationaryKokbat, parentId: '6', isFeatured: false, subCategory: []),
      CategoryModel(id: '26', name: 'Pen', image: AImages.stationaryPen, parentId: '6', isFeatured: false, subCategory: []),
        ]),

    //toys
    CategoryModel(id: '7', name: 'Toys', image: AImages.toysIcon, isFeatured: true,
        subCategory: [
      CategoryModel(id: '27', name: 'Car', image: AImages.toyCar, parentId: '7', isFeatured: false, subCategory: []),
      CategoryModel(id: '28', name: 'Toy', image: AImages.toyToy, parentId: '7', isFeatured: false, subCategory: []),
        ]),
  ];

  /// List of all Brands
  static final List<BrandModel> brands = [
    BrandModel(id: '1', image: AImages.apple, name: 'Apple', productsCount: 2, isFeatured: true),
    BrandModel(id: '2', image: AImages.adidas, name: 'Adidas', productsCount: 2, isFeatured: true),
    BrandModel(id: '3', image: AImages.nike, name: 'Nike', productsCount: 8, isFeatured: true),
    BrandModel(id: '4', image: AImages.bloody, name: 'Bloody', productsCount: 4, isFeatured: true),
    BrandModel(id: '5', image: AImages.hp, name: 'Hp', productsCount: 7, isFeatured: true),
    BrandModel(id: '6', image: AImages.polo, name: 'Polo', productsCount: 4, isFeatured: true),
  ];





}
