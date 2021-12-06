// import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  // final List items = [
  //   Image.asset("assets/banner1.png"),
  //   Image.asset("assets/logo.png")
  // ];

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 180,
              width: double.infinity,
              child: Carousel(
                autoplayDuration: Duration(seconds: 1),
                animationDuration: Duration(milliseconds: 500),
                dotBgColor: Colors.transparent,
                dotSize: 4.0,
                dotSpacing: 15.0,
                images: [
                  Image.asset(
                    "assets/banner1.png",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/banner1.png",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/banner1.png",
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    "assets/banner1.png",
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),



          
          ],
        ),
      ),
    );
  }
}
