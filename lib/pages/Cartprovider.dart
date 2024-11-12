import 'package:flutter/material.dart';
import 'package:nikeapp/Model/user_model.dart';

class CartProvider with ChangeNotifier{

    List<UsersModel> _products = [];



    List<UsersModel> get product => _products;

    void addproduct (UsersModel product){

      _products.add(product);
      notifyListeners();
    }

  void removeproduct (UsersModel product){

      _products.remove(product);
      notifyListeners();
  }
    double get totalAmount {
      double total = 0;
      for (var product in _products) {
        total += product.price ?? 0; // `price` null ola bilər, ona görə də yoxlayırıq
      }
      return total;
    }

}