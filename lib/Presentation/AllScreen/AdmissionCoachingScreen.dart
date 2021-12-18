import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:carousel_pro/carousel_pro.dart';

class AdmissionCoachingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title:
        // Image.asset("assets/logo.png", height: 130),
        Text(
          "Admission Coaching",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Container(
                  height: 250.0,
                  width: 250.0,
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey.withOpacity(0.25),
                        blurRadius: 5.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image(image: AssetImage("assets/ucclogo.png"),fit: BoxFit.cover,),
                  ),
                ),
                onTap: (){
                  Get.toNamed(AppRoutes.UCCSCREEN);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
