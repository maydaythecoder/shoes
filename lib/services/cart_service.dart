import 'package:flutter/foundation.dart';
import '../models/shoe.dart';

class CartItem {
  final Shoe shoe;
  int quantity;

  CartItem({required this.shoe, this.quantity = 1});

  double get total => shoe.price * quantity;
}

class CartService extends ChangeNotifier {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  final Map<String, CartItem> _items = {};
  Map<String, CartItem> get items => Map.unmodifiable(_items);

  List<CartItem> get itemList => _items.values.toList();

  double get total => _items.values.fold(0, (sum, item) => sum + item.total);

  int get itemCount =>
      _items.values.fold(0, (sum, item) => sum + item.quantity);

  void addItem(Shoe shoe) {
    if (_items.containsKey(shoe.title)) {
      _items[shoe.title]!.quantity++;
    } else {
      _items[shoe.title] = CartItem(shoe: shoe);
    }
    notifyListeners();
  }

  void removeItem(Shoe shoe) {
    if (_items.containsKey(shoe.title)) {
      if (_items[shoe.title]!.quantity > 1) {
        _items[shoe.title]!.quantity--;
      } else {
        _items.remove(shoe.title);
      }
      notifyListeners();
    }
  }

  void removeAllOfItem(Shoe shoe) {
    _items.remove(shoe.title);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  bool isInCart(Shoe shoe) {
    return _items.containsKey(shoe.title);
  }

  int getQuantity(Shoe shoe) {
    return _items[shoe.title]?.quantity ?? 0;
  }
}
