import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
   BottomNavBar({super.key, required this.onTabChange});

  void Function(int)? onTabChange;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: GNav(
          color: Colors.grey[400],
            activeColor: Colors.blueGrey,
            tabActiveBorder: Border.all(color: Colors.white),
            tabBackgroundColor: Colors.black12,
            mainAxisAlignment: MainAxisAlignment.center,
            tabBorderRadius: 16,
            onTabChange: (value) => onTabChange!(value),
            tabs: [
              GButton(icon: Icons.home,text: 'Shop',),
              GButton(icon: Icons.shopping_bag_rounded, text: 'Cart',),
              GButton(icon: Icons.favorite, text: 'Favorit',),
            ]),
      )
    );
  }
}
