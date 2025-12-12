import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;
  List<CategoryModel> subCategory;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeatured,
    this.parentId = '',
    required this.subCategory

  });


  /// Empty Helper Function for Model
  static CategoryModel empty() => CategoryModel(id: '', name: '', image: '', isFeatured: false, subCategory: []);

  /// Convert model to Json structure so that we can store data in Firebase
  Map<String, dynamic> toJson(){
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured' : isFeatured
    };
  }

  /// Map Json oriented document snapshot from Firebase to User Model
  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    if(document.data() != null){
      final data = document.data()!;

      // Map Json Record to Model
      return CategoryModel(
          id: document.id,
          name: data['Name'] ?? '',
          image: data['Image'] ?? '',
          parentId: data['ParentId'] ?? '',
          isFeatured: data['IsFeatured'] ?? false,
          subCategory:  data['subCategory']?? []
      );
    }else{
      return CategoryModel.empty();
    }
  }
}