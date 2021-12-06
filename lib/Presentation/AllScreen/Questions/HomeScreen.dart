import 'package:flutter/material.dart';
//import 'package:carousel_pro/carousel_pro.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Borno Bangla",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 180,
              width: double.infinity,
              child:
                Image.asset("assets/banner1.png", fit: BoxFit.cover),
              // Carousel(
              //   autoplayDuration: Duration(seconds: 1),
              //   animationDuration: Duration(milliseconds: 500),
              //   dotBgColor: Colors.transparent,
              //   dotSize: 4.0,
              //   dotSpacing: 15.0,
              //   images: [
              //     Image.asset(
              //       "assets/banner1.png",
              //       fit: BoxFit.cover,
              //     ),
              //     Image.asset(
              //       "assets/banner1.png",
              //       fit: BoxFit.cover,
              //     ),
              //     Image.asset(
              //       "assets/banner1.png",
              //       fit: BoxFit.cover,
              //     ),
              //     Image.asset(
              //       "assets/banner1.png",
              //       fit: BoxFit.cover,
              //     ),
              //   ],
              // ),
            ),


          ],
        ),
      ),
    );
  }
}
