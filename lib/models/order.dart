import '../services/cart_service.dart';
import 'shoe.dart';

class Order {
  final String id;
  final List<CartItem> items;
  final double total;
  final DateTime createdAt;
  final String status;

  Order({
    required this.id,
    required this.items,
    required this.total,
    required this.createdAt,
    this.status = 'pending',
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'items':
          items
              .map(
                (item) => {
                  'shoe': item.shoe.toJson(),
                  'quantity': item.quantity,
                },
              )
              .toList(),
      'total': total,
      'createdAt': createdAt.toIso8601String(),
      'status': status,
    };
  }

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String,
      items:
          (json['items'] as List)
              .map(
                (item) => CartItem(
                  shoe: Shoe.fromJson(item['shoe'] as Map<String, dynamic>),
                  quantity: item['quantity'] as int,
                ),
              )
              .toList(),
      total: json['total'] as double,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String,
    );
  }
}
