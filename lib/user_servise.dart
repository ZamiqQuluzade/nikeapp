import 'dart:convert';
import 'package:nikeapp/Model/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String url = 'https://fakestoreapi.com/products';

  Future<List<UsersModel>?> fetchUsers() async {

    var res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      // JSON-ı parse et və liste çevir
      List<dynamic> jsonList = jsonDecode(res.body);
      List<UsersModel> users = jsonList.map((json) => UsersModel.fromJson(json)).toList();
      return users;
    } else {
      print('İstək başarısız oldu: ${res.statusCode}');
      return null; // Hata olduğu halda null qaytar
    }
  }
}
