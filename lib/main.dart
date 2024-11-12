import 'package:flutter/material.dart';
import 'package:nikeapp/pages/Cartprovider.dart';
import 'package:nikeapp/pages/Favoritprovider.dart';
import 'package:nikeapp/pages/intropage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
     MultiProvider(providers: [
       ChangeNotifierProvider(create: (_) => FavoritesProvider()),
       ChangeNotifierProvider(create: (_) => CartProvider()),
     ],
         child:  MyApp()));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
    );
  }
}
