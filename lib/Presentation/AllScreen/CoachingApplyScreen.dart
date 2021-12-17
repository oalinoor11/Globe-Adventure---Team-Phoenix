import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CoachingApplyScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Apply Now",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 180,
              width: double.infinity,
              child:
              Image.asset("assets/uccbanner.png", fit: BoxFit.cover),
              // Carousel(
              //   autoplayDuration: Duration(seconds: 1),
              //   animationDuration: Duration(milliseconds: 500),
              //   dotBgColor: Colors.transparent,
              //   dotSize: 4.0,
              //   dotSpacing: 15.0,
              //   images: [
              //     Image.asset(
              //       "assets/uccbanner.png",
              //       fit: BoxFit.cover,
              //     ),
              //     Image.asset(
              //       "assets/uccbanner.png",
              //       fit: BoxFit.cover,
              //     ),
              //     Image.asset(
              //       "assets/uccbanner.png",
              //       fit: BoxFit.cover,
              //     ),
              //     Image.asset(
              //       "assets/uccbanner.png",
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
