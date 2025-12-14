import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String id;
  String imageUrl;
  final String targetScreen;
  bool active;

  BannerModel({
    required this.id,
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });

  static BannerModel empty() =>
      BannerModel(id: '', imageUrl: '', targetScreen: '', active: false);

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'targetScreen': targetScreen,
      'active': active,
    };
  }

  factory BannerModel.fromDocument(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    if (snapshot.data() != null) {
      Map<String, dynamic> data = snapshot.data()!;
      return BannerModel(
        id: snapshot.id,
        imageUrl: data['imageUrl'] ?? '',
        targetScreen: data['targetScreen'] ?? '',
        active: data['active'] ?? false,
      );
    } else {
      return BannerModel.empty();
    }
  }
}
