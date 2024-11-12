import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nikeapp/Model/cart_model.dart';

class CartService{
  final String url = 'https://fakestoreapi.com/carts';

  Future<List<CartModel>?> fetchcart() async{
var res= await http.get(Uri.parse(url));

if(res.statusCode == 200){

  List<dynamic> jsonlist = jsonDecode(res.body);

  List<CartModel> jsonbody = jsonlist.map((json) => CartModel.fromJson(json)).toList();
  return jsonbody;
}else{
  print('hata: ${res.statusCode}');
  return [];
}




  }

}