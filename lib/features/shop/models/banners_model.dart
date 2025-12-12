import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel{
  String imageUrl;
  final String targetScreen;
  bool active;

  BannerModel({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });


  static BannerModel empty() => BannerModel(imageUrl: '', targetScreen: '', active: false);

  Map<String, dynamic> toJson(){
    return {
      'imageUrl': imageUrl,
      'targetScreen': targetScreen,
      'active': active,
    };
  }

  factory BannerModel.fromDocument(DocumentSnapshot<Map<String, dynamic>> snapshot){
    if(snapshot.data() != null){
      Map<String, dynamic> data = snapshot.data()!;
      return BannerModel(
        imageUrl: data['imageUrl'] ?? '',
        targetScreen: data['targetScreen'] ?? '',
        active: data['active'] ?? '',
      );
    }else{
      return BannerModel.empty();
    }
  }
}