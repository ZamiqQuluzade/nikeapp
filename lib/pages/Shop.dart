import 'package:flutter/material.dart';
import 'package:nikeapp/pages/shoe.dart';

class Shop extends StatelessWidget {

  Shoe shoe;

  Shop({required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          Image.asset(shoe.sekili),
          Text('Jordan')
        ],
      ),
    );
  }
}
