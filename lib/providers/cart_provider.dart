import 'dart:convert';
import 'package:flash_fuel/screens/cart/cartItem.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CartProvider with ChangeNotifier {
  List<CartItem> _items = [];

  CartProvider() {
    _loadCartFromPrefs();
  }

  List<CartItem> get items => _items;

  double get total => _items.fold(0, (sum, item) => sum + item.price * item.quantity);

  void addToCart(CartItem item) {
    final index = _items.indexWhere((e) => e.name == item.name);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(item);
    }
    _saveCartToPrefs();
    notifyListeners();
  }

  void removeFromCart(CartItem item) {
    _items.removeWhere((e) => e.name == item.name);
    _saveCartToPrefs();
    notifyListeners();
  }

  void increaseQty(CartItem item) {
    item.quantity++;
    _saveCartToPrefs();
    notifyListeners();
  }

  void decreaseQty(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    } else {
      _items.remove(item);
    }
    _saveCartToPrefs();
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    _saveCartToPrefs();
    notifyListeners();
  }

  Future<void> _saveCartToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = _items.map((e) => e.toMap()).toList();
    prefs.setString('cart', jsonEncode(cartData));
  }

  Future<void> _loadCartFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final cartString = prefs.getString('cart');
    if (cartString != null) {
      final decoded = jsonDecode(cartString) as List;
      _items = decoded.map((item) => CartItem.fromMap(item)).toList();
      notifyListeners();
    }
  }
}