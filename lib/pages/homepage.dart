import 'package:flutter/material.dart';
import 'package:nikeapp/Model/user_model.dart';
import 'package:nikeapp/componets/bottomnavbar.dart';
import 'package:nikeapp/main.dart';
import 'package:nikeapp/pages/cartpage.dart';
import 'package:nikeapp/pages/favory.dart';
import 'package:nikeapp/pages/shoppage.dart';


class HomePage extends StatefulWidget {
 
 

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int selectindex = 0;

  void navigatorbottom(int index){
    setState(() {
      selectindex = index;
    });
  }

  final List<Widget> _pages = [
   ShopPage(),
   CartPage(),
    FavoryPage()


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          bottomNavigationBar: BottomNavBar(
            onTabChange: (index) => navigatorbottom(index),
          ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(builder: (context) => IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
            Scaffold.of(context).openDrawer();
          },
        ),
        ),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage())
                );
              },
              child: IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => FavoryPage()));
              }, icon: Icon(Icons.favorite))
            ),
          )
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.black26,
        child: Column(
          children: [
            DrawerHeader(child: Image.asset('lib/image/nikee.png', color: Colors.white,)),

            Padding(
              padding:  EdgeInsets.only(left: 17),
              child: ListTile(
               leading: GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));}, child: Icon(Icons.home,color: Colors.white,size: 30,)),
                title: Text('Esas', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 17),
              child: ListTile(
                leading: Icon(Icons.sentiment_satisfied_rounded,color: Colors.white,size: 30,),
                title: Text('Haqqinda', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            ),

          ],
        ),
      ),
      body: _pages[selectindex],


    );
  }
}
