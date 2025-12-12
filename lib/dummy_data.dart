import 'package:e_commerce/utils/constants/images.dart';

import 'features/shop/models/category_model.dart';

class ADummyData {
  /// List of all Banners

  // static final List<BannerModel> banner = [
  //   BannerModel(imageUrl: AImages.homeBanner1, targetScreen: ARoutes.order, active: true),
  //   BannerModel(imageUrl: AImages.homeBanner2, targetScreen: ARoutes.cart, active: true),
  //   BannerModel(imageUrl: AImages.homeBanner3, targetScreen: ARoutes.wishlist, active: true),
  //   BannerModel(imageUrl: AImages.homeBanner4, targetScreen: ARoutes.productDetail, active: true),
  //   BannerModel(imageUrl: AImages.homeBanner5, targetScreen: ARoutes.profile, active: true),
  // ];

  /// List of all Categories
  static final List<CategoryModel> categories = [
    /// Parent Categories
    CategoryModel(id: '1', name: 'Food', image: AImages.foodIcon, isFeatured: true),
    CategoryModel(id: '2', name: 'Kitchen Utils', image: AImages.kitchenIcon, isFeatured: true),
    CategoryModel(id: '3', name: 'Fashion', image: AImages.fashionIcon, isFeatured: true),
    CategoryModel(id: '4', name: 'Skin Care', image: AImages.skinIcon, isFeatured: true),
    CategoryModel(id: '5', name: 'Electronics', image: AImages.electronicsIcon, isFeatured: true),
    CategoryModel(id: '6', name: 'Stationary', image: AImages.stationaryIcon, isFeatured: true),
    CategoryModel(id: '7', name: 'Toys', image: AImages.toysIcon, isFeatured: true),

    /// food
    // CategoryModel(id: '8', name: 'Shirts', image: AImages.food_mango, parentId: '1'),
    // CategoryModel(id: '9', name: 'Jackets', image: AImages., parentId: '1'),
    // CategoryModel(id: '10', name: 'Shorts', image: AImages., parentId: '1'),

    /// Kitchen utils
    // CategoryModel(id: '11', name: 'Formal Shoes', image: AImages.formalShoesIcon, parentId: '2'),
    // CategoryModel(id: '12', name: 'Sports Shoes', image: AImages.sportsShoesIcon, parentId: '2'),
    //
    // /// fashion
    // CategoryModel(id: '13', name: 'Face', image: AImages.faceIcon, parentId: '3'),
    // CategoryModel(id: '14', name: 'Hair Oils', image: AImages.hairOilIcon, parentId: '3'),
    // CategoryModel(id: '15', name: 'Bags', image: AImages.bagsIcon, parentId: '3'),
    // CategoryModel(id: '16', name: 'Perfumes', image: AImages.perfumeIcon, parentId: '3'),
    // CategoryModel(id: '17', name: 'Watches', image: AImages.watchIcon, parentId: '3'),
    //
    // /// skin care
    // CategoryModel(id: '18', name: 'Gadgets', image: AImages.gadgetsIcon, parentId: '4', isFeatured: false),
    // CategoryModel(id: '19', name: 'Laptops', image: AImages.laptopsIcon, parentId: '4', isFeatured: false),
    // CategoryModel(id: '20', name: 'Mobiles', image: AImages.mobileIcon, parentId: '4', isFeatured: false),
    //
    // /// electronics
    // CategoryModel(id: '21', name: 'Bed', image: AImages.bedIcon, parentId: '5', isFeatured: false),
    // CategoryModel(id: '22', name: 'Lamps', image: AImages.lampIcon, parentId: '5', isFeatured: false),
    //
    // /// stationary
    // CategoryModel(id: '23', name: 'Cricket', image: AImages.cricketIcon, parentId: '6', isFeatured: false),
    // CategoryModel(id: '24', name: 'Soccer', image: AImages.soccerIcon, parentId: '6', isFeatured: false),
    //
    //toys

  ];}