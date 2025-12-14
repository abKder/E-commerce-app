import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/constants/images.dart';

import 'features/shop/models/banners_model.dart';
import 'features/shop/models/brand_model.dart';
import 'features/shop/models/category_model.dart';
import 'features/shop/models/product_attribute_model.dart';
import 'features/shop/models/product_model.dart';
import 'features/shop/models/product_variation_model.dart';

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


  /// List of all products - 68 Products
  static final List<ProductModel> products = [
    // 001
    ProductModel(
        id: '1',
        title: 'Casual Denim & Tee Set With Glossy Slip-On Shoes',
        stock: 15,
        price: 115,
        thumbnail: AImages.fFishDessert,
        description:
        "Stay stylish and comfortable with this casual outfit combo featuring a soft olive-green T-shirt, classic denim shorts, and sleek black slip-on shoes. Perfect for laid-back days or casual outings. Easy to wear, easy to love — all-in-one style made simple.",
        brand: brands[0],
        salePrice: 100,
        sku: 'ABR4568',
        categoryId: '7',
        productType: 'ProductType.single'),

    // 002
    ProductModel(
        id: '2',
        title: 'ProGrip Indoor/Outdoor Basketball',
        stock: 15,
        price: 30,
        isFeatured: true,
        thumbnail: AImages.fBreakfast,
        description:
        'Elevate your game with the ProGrip™ Basketball — designed for both indoor courts and outdoor play. Its textured grip ensures maximum control, while the durable rubber build offers long-lasting performance. Perfect for casual shoots or intense matches!',
        brand: brands[0],
        salePrice: 24,
        sku: 'ABR4568',
        categoryId: '23',
        productType: 'ProductType.single'),

    // 003
    ProductModel(
        id: '3',
        title: 'Apple iPhone 14 (Blue) – Super Retina Display, A15 Bionic',
        stock: 15,
        price: 700,
        isFeatured: false,
        thumbnail: AImages.ePhone,
        description:
        'Experience the power of the A15 Bionic chip, advanced dual-camera system, and stunning Super Retina XDR display. The iPhone 14 in elegant blue delivers lightning-fast performance, all-day battery life, and next-level photography — all in a sleek, durable design.',
        brand: brands[5],
        salePrice: 679,
        sku: 'ABR4568',
        categoryId: '19',
        productAttributes: [
          ProductAttributeModel(name: 'Storage', values: ['128GB', '256GB', '512GB']),
        ],
        productVariations: [
           ProductVariationModel(
              id: '1',
              attributeValues: {'Storage': '128GB'},
              price: 600,
              description: 'This is description of 128GB Storage',
              sku: 'iPhoneSKU',
              stock: 10),
          ProductVariationModel(
              id: '2',
              attributeValues: {'Storage': '256GB'},
              price: 650,
              description: 'This is description of 256GB Storage',
              sku: 'iPhoneSKU',
              stock: 20),
          ProductVariationModel(
              id: '3',
              attributeValues: {'Storage': '512GB'},
              price: 700,
              description: 'This is description of 512GB Storage',
              sku: 'iPhoneSKU',
              stock: 10)
        ],
        productType: 'ProductType.variable'),

    // 004
    ProductModel(
        id: '4',
        title: 'Apple iPhone X (64GB/256GB) – Space Gray & Silver Variants',
        stock: 15,
        price: 350,
        isFeatured: true,
        thumbnail: AImages.eWatch,
        description:
        'The Apple iPhone X redefined smartphones with its edge-to-edge 5.8” Super Retina display, powerful A11 Bionic chip, and Face ID facial recognition technology. Its sleek glass body, dual 12MP cameras, and wireless charging make it a top choice for premium performance and timeless style.',
        brand: brands[2],
        images: [AImages.eWatch, AImages.eWatch, AImages.eWatch, AImages.eWatch],
        sku: 'ABR4568',
        categoryId: '19',
        productAttributes: [
          ProductAttributeModel(name: 'Storage', values: ['64GB', '128GB', '256GB']),
          ProductAttributeModel(name: 'Color', values: ['Black', 'Silver'])
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              stock: 5,
              price: 250,
              image: AImages.eWatch,
              description: 'This is product description for 64GB Black',
              attributeValues: {'Storage': '64GB', 'Color': 'Black'}),
          ProductVariationModel(
              id: '2',
              stock: 15,
              price: 290,
              image: AImages.eWatch,
              attributeValues: {'Color': 'Black', 'Storage': '128GB'}),
          ProductVariationModel(
              id: '3',
              stock: 0,
              price: 350,
              image: AImages.eWatch,
              attributeValues: {'Color': 'Black', 'Storage': '256GB'}),
          ProductVariationModel(
              id: '4',
              stock: 222,
              price: 250,
              image: AImages.eWatch,
              attributeValues: {'Color': 'Silver', 'Storage': '64GB'}),
          ProductVariationModel(
              id: '5',
              stock: 0,
              price: 290,
              image: AImages.eWatch,
              attributeValues: {'Color': 'Silver', 'Storage': '128GB'}),
          ProductVariationModel(
              id: '6',
              stock: 11,
              price: 350,
              image: AImages.eWatch,
              attributeValues: {'Color': 'Silver', 'Storage': '256GB'}),
        ],
        productType: 'ProductType.variable'),

    // 005
    ProductModel(
        id: '5',
        title: 'Floral Affair Perfume – 100ml Romantic, Elegant & Timeless',
        stock: 15,
        price: 60,
        isFeatured: false,
        thumbnail: AImages.toyCar,
        description:
        'Floral Affair captures the essence of blooming cherry blossoms with a soft, feminine fragrance that lingers beautifully. Ideal for daily wear or special evenings, it’s a delicate blend of floral notes that leaves a lasting impression.',
        brand: brands[6],
        salePrice: 58.99,
        sku: 'ABR4568',
        categoryId: '15',
        productType: 'ProductType.single'),

    // 006
    ProductModel(
        id: '6',
        title: 'J. Kitchen Utils',
        stock: 0,
        price: 50,
        thumbnail: AImages.kitchenItem1,
        description:
        'J. Pour Femme is a sophisticated fragrance designed for the modern woman. With a graceful blend of floral and musky notes, it delivers a soft yet long-lasting scent perfect for everyday elegance or special occasions.',
        brand: brands[2],
        salePrice: 48.99,
        sku: 'ABR4568',
        categoryId: '15',
        productType: 'ProductType.single'),

    // 007
    ProductModel(
      id: '7',
      title: 'Smoky Vanillin – Romantic Perfume 150ml',
      stock: 10,
      price: 70,
      isFeatured: true,
      thumbnail: AImages.kitchenItem2,
      //16/512
      description:
      "Smoky Vanillin is an intense and captivating fragrance that blends rich vanilla with deep smoky undertones. Designed for those who love bold and lasting scents, this perfume brings a touch of luxury and mystery to your signature style.",
      brand: brands[2],
      salePrice: 64.99,
      sku: 'SKU-PERFUME',
      categoryId: '15',
      productType: 'ProductType.single',
    ),

    // 008
    ProductModel(
      id: '8',
      title: 'Bloom Pour Femme – Long Lasting Perfume 200ml',
      stock: 50,
      price: 55.99,
      thumbnail: AImages.kitchenItem3,
      description:
      'Bloom Pour Femme is a delightful fragrance that captures the beauty of blossoming flowers in every spray. With soft floral notes and a refreshing finish, this perfume is perfect for daily wear and adds a gentle, graceful touch to your presence.',
      salePrice: 49.99,
      brand: brands[1],
      sku: 'SKU-PERFUME',
      categoryId: '15',
      productType: 'ProductType.single',
    ),

    // 009
    ProductModel(
      id: '9',
      title: 'Warm Striped Socks – Red and Cream Colo',
      stock: 30,
      salePrice: 7.99,
      price: 8.99,
      thumbnail: AImages.skinBeauty,
      description:
      "Add a pop of color to your step with these soft, cozy striped socks in a vibrant red and cream design. Perfect for daily wear, lounging, or gifting – these socks offer warmth and comfort without compromising on style.",
      brand: brands[3],
      sku: 'NDURE_SOCKS',
      categoryId: '9',
      productType: 'ProductType.single',
    ),

    // 010
    ProductModel(
        id: '10',
        title: 'Urban Edge High-Top Sneakers – Blue Edition',
        brand: brands[3],
        thumbnail: AImages.skinClinic,
        description:
        "Step up your street style with these trendy blue high-top sneakers. Designed with breathable mesh panels, cushioned ankle support, and durable laces, they offer a perfect mix of comfort and edge — ideal for casual outings or everyday wear.",
        price: 59.99,
        stock: 10,
        categoryId: '11',
        sku: 'BATA-SHOES',
        productAttributes: [
          ProductAttributeModel(name: 'Size', values: ['40', '41', '42'])
        ],
        productType: 'ProductType.variable',
        productVariations: [
          ProductVariationModel(
              id: '1',
              description: 'This is description of Blue 40 Size Shoes',
              price: 59.99,
              stock: 10,
              image: AImages.skinClinic,
              attributeValues: {'Size': '40'}),
          ProductVariationModel(
              id: '2',
              description: 'This is description of Blue 41 Size Shoes',
              price: 59.99,
              stock: 10,
              image: AImages.skinClinic,
              attributeValues: {'Size': '41'}),
          ProductVariationModel(
              id: '3',
              description: 'This is description of Blue 42 Size Shoes',
              price: 59.99,
              stock: 10,
              image: AImages.skinClinic,
              attributeValues: {'Size': '42'}),
        ]),

    // 011
    ProductModel(
      id: '11',
      title: 'Bata Ankle Socks – Black & White (Unisex)',
      stock: 200,
      price: 4,
      description:
      "These classic ankle-length Bata socks combine a sleek black base with a white cuff and a snug fit for all-day comfort. Perfect for daily wear, sports, or casual outings, they offer a breathable and stretchable design with premium-quality fabric.",
      thumbnail: AImages.fashionPant,
      sku: 'BATA-SOCKS',
      categoryId: '9',
      isFeatured: true,
      brand: brands[3],
      productType: 'ProductType.single',
    ),

    // 012
    ProductModel(
        id: '12',
        title: 'Bata Formal Socks – Black with Grey Stripes,  Classic, Breathable & Office-Ready',
        stock: 10,
        price: 4.99,
        thumbnail: AImages.fDessert,
        description:
        "Designed for everyday elegance, these black formal socks from Bata feature subtle grey stripes and a comfortable stretch fit. Ideal for workwear or formal occasions, they provide a smooth finish, reinforced toe, and breathable fabric for all-day wear.",
        sku: "BATA-SOCKS",
        brand: brands[3],
        categoryId: '9',
        productType: 'ProductType.single'),

    // 013
    ProductModel(
        id: '13',
        title: 'Chic Mini Handbag – Electric Blue',
        price: 39.99,
        stock: 23,
        thumbnail: AImages.toyToy,
        description:
        "Turn heads with this vibrant electric blue mini handbag, designed for fashion-forward women on the go. Featuring a sleek structure, sturdy handles, and a polished zipper finish, it’s perfect for essentials like your phone, wallet, and keys — ideal for both day and",
        sku: 'J.-BAGS',
        brand: brands[4],
        categoryId: '14',
        productType: 'ProductType.single'),

    // 014
    ProductModel(
        id: '14',
        title: 'Men’s Classic Black Loafers – Tassel Design',
        price: 99.99,
        stock: 3,
        salePrice: 87.99,
        thumbnail: AImages.stationaryColorPen,
        description:
        "Step into sophistication with these sleek black loafers featuring a polished finish and stylish tassel detail. Designed for formal events, office wear, or smart-casual outings, these shoes offer both comfort and class with every step.",
        sku: 'NDURE-FORMAL',
        brand: brands[3],
        categoryId: '10',
        productType: 'ProductType.single'),

    // 015
    ProductModel(
        id: '15',
        title: 'Men’s Athletic Running Shoes – Blue & Grey Lightweight. Breathable. Performance-Ready',
        price: 54.99,
        stock: 54,
        salePrice: 47.99,
        thumbnail: AImages.stationaryDaba,
        description:
        "Hit the ground running with these sporty blue and grey athletic shoes. Built for comfort and grip, they feature a breathable mesh upper, cushioned sole, and durable traction — ideal for workouts, jogs, or everyday active wear.",
        sku: 'SPORTS-SHOES',
        brand: brands[4],
        categoryId: '11',
        productType: 'ProductType.single'),

    // 016
    ProductModel(
      id: '16',
      title: 'Breakout Men’s Hooded Winter Jacket – Khaki',
      price: 79.99,
      salePrice: 71.99,
      thumbnail: AImages.stationaryKokbat,
      images: [AImages.stationaryKokbat],
      stock: 153,
      description:
      "Stay cozy and stylish with this khaki hooded winter jacket from Breakout. Designed with a soft inner lining, full front zip, and buttoned flap pockets, it’s perfect for chilly days and casual outings. The ribbed cuffs and hem ensure a snug fit all day long.",
      sku: 'JACKET-BREAKOUT',
      categoryId: '8',
      brand: brands[6],
      productType: 'ProductType.single',
    ),

    // 017
    ProductModel(
      id: '17',
      title: 'Breakout Men’s Checkered Flannel Shirt – Blue & Black',
      price: 34.99,
      salePrice: 31.99,
      stock: 19,
      brand: brands[5],
      thumbnail: AImages.fDessert,
      description:
      "Elevate your everyday look with this stylish blue and black checkered flannel shirt from Breakout. Crafted from soft, breathable fabric, it features twin front pockets, button-down design, and a classic fit — perfect for layering or wearing on its own.",
      sku: "SHORT-BREAKOUT",
      productType: 'ProductType.single',
      categoryId: '7',
    ),

    // 018
    ProductModel(
        id: '18',
        title: 'Breakout Men’s Relaxed Fit Shirt – Light Grey (Short Sleeve)',
        price: 29.99,
        salePrice: 23.99,
        thumbnail: AImages.fBreakfast,
        stock: 12,
        brand: brands[6],
        categoryId: '7',
        description:
        "Keep it cool and casual with this light grey relaxed fit shirt from Breakout. Featuring short sleeves, a soft collar, and breathable fabric, it’s perfect for summer days, beach outings, or layering over a tee. A wardrobe staple with effortless style.",
        sku: "SHORT-WHITE-BREAKOUT",
        productType: 'ProductType.single'),

    // 019
    ProductModel(
      id: '19',
      title: 'Men’s Classic Slip-On Dress Shoes – Tan Brown',
      price: 59.99,
      salePrice: 49.99,
      thumbnail: AImages.kitchenItem5,
      images: [AImages.kitchenItem5],
      stock: 12,
      brand: brands[10],
      categoryId: '10',
      description:
      "Add timeless charm to your formal look with these sleek tan brown slip-on dress shoes. Featuring a smooth leather finish, cushioned insole, and durable sole, they’re perfect for the office, business events, or formal occasions.",
      sku: "FORMAL-BROWN-NDURE",
      productType: 'ProductType.single',
    ),

    // 020
    ProductModel(
      id: '20',
      title: 'Men’s Casual Lace-Up Sneakers – Coffee Brown',
      thumbnail: AImages.eAnalogWatch,
      price: 44.99,
      salePrice: 39.99,
      stock: 43,
      brand: brands[3],
      categoryId: '11',
      description:
      "hese coffee brown lace-up sneakers are the perfect mix of casual and cool. With a smooth finish, contrasting navy laces, and cushioned sole, they’re designed for daily wear, from weekend hangouts to casual office days.",
      sku: "COFFEE-BROWN-BATA",
      productType: 'ProductType.single',
    ),

    // 021
    ProductModel(
        id: '21',
        title: 'Casual Winter Outfit Set – Olive Sweater, Blue Jeans & Grey Sneakers',
        thumbnail: AImages.eCamera,
        price: 89.99,
        salePrice: 78.87,
        categoryId: '7',
        brand: brands[1],
        stock: 23,
        description:
        "This cozy winter-ready combo features a chunky olive green knit sweater, classic blue denim jeans, and a pair of trendy grey sneakers with tan laces. Whether you’re heading out for a casual day or a weekend hangout, this outfit offers both comfort and effortless style.",
        sku: 'ADIDAS-COMBO',
        productType: 'ProductType.single'),
  ];




}
