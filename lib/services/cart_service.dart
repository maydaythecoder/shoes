import 'package:flutter/foundation.dart';
import '../models/shoe.dart';

class CartService extends ChangeNotifier {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final List<Shoe> _items = [];
  List<Shoe> get items => List.unmodifiable(_items);

  double get total => _items.fold(0, (sum, item) => sum + item.price);

  void addItem(Shoe shoe) {
    _items.add(shoe);
    notifyListeners();
  }

  void removeItem(Shoe shoe) {
    _items.remove(shoe);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  bool isInCart(Shoe shoe) {
    return _items.contains(shoe);
  }
}
