import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/personalization/models/address_model.dart';
import 'package:e_commerce/features/shop/models/cart_item_model.dart';
import 'package:e_commerce/utils/helpers/helper_function.dart';

enum OrderStatus { processing, delivered, shipped, cancelled }

class OrderModel {
  final String id;
  final String userId;
  final OrderStatus status; // Enum status
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final DateTime? deliveryDate;
  final List<CartItemModel> items;

  OrderModel({
    required this.id,
    this.userId = '',
    required this.status,
    required this.items,
    required this.totalAmount,
    required this.orderDate,
    this.paymentMethod = 'Paypal',
    this.address,
    this.deliveryDate,
  });

  String get formattedOrderDate => AHelperFunctions.getFormattedDate(orderDate);

  String get formattedDeliveryDate =>
      AHelperFunctions.getFormattedDate(deliveryDate);

  String get orderStatusText => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : status == OrderStatus.cancelled
              ? 'Cancelled'
              : 'Processing';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'status': status.toString(), // Enum to string
      'totalAmount': totalAmount,
      'orderDate': orderDate,
      'paymentMethod': paymentMethod,
      'address': address?.toJson(), // convert address model to map
      'deliveryDate': deliveryDate,
      'items': items
          .map((item) => item.toJson())
          .toList() // convert CartItemModel to map
    };
  }

  factory OrderModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    // Fallback for userId from path if missing in data
    String userId = '';
    if (data.containsKey('userId')) {
      userId = data['userId'] as String;
    }
    if (userId.isEmpty && snapshot.reference.parent.parent != null) {
      userId = snapshot.reference.parent.parent!.id;
    }

    return OrderModel(
      id: snapshot.id,
      userId: userId,
      status: OrderStatus.values.firstWhere(
          (element) => element.toString() == data['status'],
          orElse: () => OrderStatus.processing),
      totalAmount: data['totalAmount'] as double,
      orderDate: (data['orderDate'] as Timestamp).toDate(),
      paymentMethod: data['paymentMethod'] as String,
      address: data['address'] != null
          ? AddressModel.fromMap(data['address'] as Map<String, dynamic>)
          : null,
      deliveryDate: (data.containsKey('deliveryDate') &&
              data['deliveryDate'] is Timestamp)
          ? (data['deliveryDate'] as Timestamp).toDate()
          : null,
      items: (data['items'] as List<dynamic>)
          .map((itemData) =>
              CartItemModel.fromJson(itemData as Map<String, dynamic>))
          .toList(),
    );
  }
}
