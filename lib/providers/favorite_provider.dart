import 'package:flutter/material.dart';
import '../models/product.dart';

class FavoriteProvider with ChangeNotifier {
  final List<Product> _favorites = [];

  List<Product> get favorites => _favorites;

  void addFavorite(Product product) {
    if (!_favorites.any((item) => item.name == product.name)) {
      _favorites.add(product);
      notifyListeners();
    }
  }

  void removeFavorite(Product product) {
    _favorites.removeWhere((item) => item.name == product.name);
    notifyListeners();
  }

  bool isFavorite(Product product) {
    return _favorites.any((item) => item.name == product.name);
  }
}
