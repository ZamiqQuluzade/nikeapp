import 'package:flutter/material.dart';
import 'package:nikeapp/Model/user_model.dart';
import 'package:nikeapp/pages/Cartprovider.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
   UsersModel product;

   ProductScreen({required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    var ekranbilgisi = MediaQuery.of(context);

    double ekranyuksekliyi = ekranbilgisi.size.height;
    double ekrangenisliyi = ekranbilgisi.size.width;

    
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 15),
                child: GestureDetector(child: Icon(Icons.favorite, size: ekrangenisliyi * 0.1,)),
              )
            ],
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network('${widget.product.image}', height: ekranyuksekliyi/2.5,),
              ),
                  SizedBox(height: ekranyuksekliyi * 0.03,),
              Padding(
                padding: EdgeInsets.only(left: 45),
                child: Text(
                  '${widget.product.title}', style: TextStyle(fontSize: 17),
                ),
              ),
              SizedBox(height: ekranyuksekliyi * 0.02,),
              Row(
                children: [
                  Container(
                    width: ekrangenisliyi / 3,
                    height: ekranyuksekliyi * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Center(
                        child: Padding(
                      padding:  EdgeInsets.all(9.0),
                      child: Text('Endirim Kuponu', style: TextStyle(color: Colors.white),),
                    )),
                  ),
                  Spacer(),
                  Padding(
                    padding:  EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        Text('${widget.product.rating?.rate.toString()}'),
                        Icon(Icons.star, color: Colors.green,)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: ekranyuksekliyi * 0.01,),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text('Information', style: TextStyle(fontSize: 17),),
              ),
              Text('${widget.product.description}'),
                SizedBox(height: 20,),
                Text('Qiyməti: ${widget.product.price}\$', style: TextStyle(fontSize: 27),),
                SizedBox(height: ekranyuksekliyi * 0.06,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: ekranyuksekliyi * 0.07,
                    width: ekrangenisliyi/2,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(4)
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(right: 10, left: 18, top: 10),
                      child: Text('Sifarişə Davam ', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                    ),

                  ),
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: ekranyuksekliyi * 0.07,
                      width: ekrangenisliyi/2,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4)
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(right: 10, left: 18, top: 10),
                        child: GestureDetector(
                          onTap: (){
                            Provider.of<CartProvider>(context, listen: false).addproduct(widget.product);
                          },
                            child: Text('Səbətə Əlavə Et', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)),
                      ),

                    ),
                  )
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
