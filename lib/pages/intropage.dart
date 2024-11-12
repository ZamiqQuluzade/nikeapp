import 'package:flutter/material.dart';
import 'package:nikeapp/pages/homepage.dart';
import 'package:nikeapp/pages/shoppage.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25,top: 50),
                  child: Image.asset('lib/image/nikee.png', height: 240,),
                ),
                SizedBox(height: 48),

                Text('Just Do It',
                  style: TextStyle(fontSize: 40),),

                SizedBox( height:  24),


                Text('Bu Mehsulu elde etmek ucun platformamiza xos gelmisiniz. Alisverise davam etmek ucun klik edin ',

                    style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
                SizedBox( height:  24),

                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Center(
                          child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                              },
                              child: Text('Sifarise Basla',style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),))),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

    );
  }
}
