import 'package:flutter/foundation.dart';

import '../models/cart_item.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items;

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (exisitingItem) => CartItem(
              id: exisitingItem.id,
              title: exisitingItem.title,
              price: exisitingItem.price,
              quantitiy: exisitingItem.quantitiy + 1));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantitiy: 1));
    }
  }
}
