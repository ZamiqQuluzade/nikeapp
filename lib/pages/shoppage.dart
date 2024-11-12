import 'package:flutter/material.dart';
import 'package:nikeapp/Model/user_model.dart';
import 'package:nikeapp/pages/Favoritprovider.dart';
import 'package:nikeapp/pages/ProductScreen.dart';
// import 'package:nikeapp/pages/favory.dart';
import 'package:provider/provider.dart';
// import 'package:shimmer/shimmer.dart';
import '../user_servise.dart';


class ShopPage extends StatefulWidget {


  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  UserService service = UserService();
  List<UsersModel> products = [];// List<ProductModel> olmalıdır
  List<UsersModel> filtrcontrol = [];
  bool isloading= true;

  TextEditingController searchcontrol = TextEditingController();

  @override
  void initState() {
    super.initState();

    isloading= true;
    service.fetchUsers().then( // fetchProducts olmalidir
        (data){
          setState(() {
            products = data!;
            filtrcontrol = products;
            isloading = false;
          });
        }
    );
  }

  String searchText = '';

    void onsearch(String value){
    setState(() {
       searchText = value;
       myFiltr();
    });
    }

    void myFiltr(){
    if(searchText.isEmpty){
      filtrcontrol = products;
    }else{
      filtrcontrol = products.where((product) {
        return product.title != null && product.title!.toLowerCase().contains(searchText.toLowerCase());
      }).toList();
    }
    }

  List<UsersModel> favoritesList = [];

  // Rename UsersModel to ProductModel
  void toggleFavorite(UsersModel product) {
    Provider.of<FavoritesProvider>(context, listen: false).toggleFavorite(product);
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.symmetric(horizontal: 25),
          decoration: BoxDecoration(color: Colors.grey[350], borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  controller: searchcontrol,
                  onChanged: onsearch,
                  decoration: InputDecoration(
                    hintText: 'Axtaris..',
                    border: InputBorder.none,
                  ),

                    ),
              ), // Axtaris yerim buradi duzelt
              Icon(Icons.search),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Text('Orjinal nike mehsullari ile tanis olsun.', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('En Cox Satilan', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
              Text('Basqalari...', style: TextStyle(color: Colors.blue)),
            ],
          ),
        ),
        SizedBox(height: 20),

        Expanded(
          child:  FutureBuilder(
          future: service.fetchUsers(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              var maqazin = snapshot.data;
              return  GridView.builder(
                itemCount: maqazin!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.645
                ),
                itemBuilder: (context, index) {
                  var product = filtrcontrol[index];
                  bool isFavorite = Provider.of<FavoritesProvider>(context).favorites.contains(product);

                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductScreen(product: product)));
                    },
                    child:   Card(
                      elevation: 50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 160,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  image: NetworkImage(product.image!), )
                            ),
                          ),// Image.network istifadə e
                          Text('${product.title}',
                              maxLines: 2,
                              style: TextStyle(fontSize: 20)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.green,
                                ),
                                child: Row(
                                  children: [
                                    Text('${product.rating?.rate.toString()}',style: TextStyle(fontSize: 20),),
                                    Icon(Icons.star)
                                  ],
                                ),
                              ),
                              Text('${product.category?.toLowerCase()}'),
                            ],
                          ),
                          Row(
                            children: [
                              Text('${product.price}\$', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                              Spacer(),
                              IconButton(
                                onPressed: (){
                                  toggleFavorite(product);
                                  setState(() {
                                  });
                                },// Düzəliş edildi
                                icon: Icon(
                                  isFavorite ? Icons.favorite : Icons.favorite_border,
                                  color: isFavorite ? Colors.red : null,
                                ),
                              ),

                            ],

                        )
                        ],
                      ),
                    ),
                  );
                }
              ) ;
            }else{
              return Center();

    }
        }

    )

        ) ],
    );
  }
}
