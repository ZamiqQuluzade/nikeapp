import 'package:flutter/material.dart';
import 'package:nikeapp/Model/cart_model.dart';
import 'package:nikeapp/cartservice.dart';
import 'package:nikeapp/pages/Cartprovider.dart';
import 'package:nikeapp/pages/ProductScreen.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    // CartProvider vasitəsilə cart məlumatlarını alırıq
    final cartprovider = Provider.of<CartProvider>(context);

    return Scaffold(

      body: Stack(
        children: [
          // Məhsul siyahısını göstərən ListView
          ListView.builder(
            itemCount: cartprovider.product.length,
            itemBuilder: (context, index) {
              var product = cartprovider.product[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                       blurRadius: 8,
                       offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.network('${product.image}'),
                      Text('${product.title}'),
                      Spacer(),
                      IconButton(
                          onPressed: (){

                          }, icon: Icon(Icons.plus_one)),
                      IconButton(
                          onPressed: (){}, icon: Icon(Icons.minimize)),
                    ],
                  )
                ),
              );
            },
          ),

          // Total qiyməti göstərmək üçün Positioned widget
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: \$${cartprovider.totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Ödəniş səhifəsinə keçmək və ya digər əməliyyatlar
                    },
                    child: Text('Checkout'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
