import 'package:flutter/material.dart';
import 'package:nikeapp/Model/user_model.dart';
import 'package:nikeapp/pages/Favoritprovider.dart';
import 'package:provider/provider.dart';


// FavoritesPage
class FavoryPage extends StatefulWidget {
  //List<UsersModel> favoryproduct;


 // FavoryPage({required this.favoryproduct});

  @override
  State<FavoryPage> createState() => _FavoryPageState();
}

class _FavoryPageState extends State<FavoryPage> {



  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<FavoritesProvider>(context).favorites;
    return Scaffold(
      appBar: AppBar(),
      body: favorites.isEmpty ? Center(
        child: Text('Mehsul Secmemisiniz'),) :
        ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index){
              var favor = favorites[index];

              return Card(
                child: Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: NetworkImage(favor.image!), )
                  ),
                ),
              );
            })
    );
  }
}
