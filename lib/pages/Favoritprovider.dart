import 'package:flutter/material.dart';
import 'package:nikeapp/Model/user_model.dart';
// Import your UsersModel

class FavoritesProvider with ChangeNotifier {
  List<UsersModel> _favorites = [];

  List<UsersModel> get favorites => _favorites;

  void toggleFavorite(UsersModel product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }

  }
}
