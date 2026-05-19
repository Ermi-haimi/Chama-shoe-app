import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'cart_shoe_model.dart';
import 'shoe_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartShoeModel> _items = [];

  List<CartShoeModel> get items => _items;

  void addToCart({
    required Shoe shoe,
    required String size,
  }) {
    final existingIndex = _items.indexWhere(
      (item) => item.shoe.name == shoe.name && item.size == size,
    );

    if (existingIndex != -1) {
      _items[existingIndex].quantity++;
    } else {
      _items.add(
        CartShoeModel(
          shoe: shoe,
          size: size,
        ),
      );
    }

    notifyListeners();
  }

  void removeItem(CartShoeModel item) {
    _items.remove(item);

    notifyListeners();
  }

  void increaseQuantity(CartShoeModel item) {
    item.quantity++;

    notifyListeners();
  }

  void decreaseQuantity(CartShoeModel item) {
    if (item.quantity > 1) {
      item.quantity--;
    }

    notifyListeners();
  }

  double get totalPrice {
    double total = 0;

    for (final item in _items) {
      total += item.shoe.price * item.quantity;
    }

    return total;
  }
}
