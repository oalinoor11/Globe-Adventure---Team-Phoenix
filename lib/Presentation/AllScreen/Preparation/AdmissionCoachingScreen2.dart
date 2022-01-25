import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../Firebase/FirebaseCollections.dart';

class AdmissionCoachingScreen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Coaching Name",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.toNamed(AppRoutes.ADDCOURSESCREEN);
          }),

      body: Column(
        children: [
          SizedBox(height: 10),

          CarouselSlider(
            options: CarouselOptions(
              height: 120.0,
              viewportFraction: 1.0,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            items: [1].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    child: Image.asset(
                      "assets/uccbanner.png",
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
          ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.fromLTRB(11.0, 0.0, 11.0, 0.0),
            child:
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        height: 180.0,
                        width: 180.0,
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
                          child: Image(image: AssetImage("assets/ucc_aunit.png"),fit: BoxFit.cover,),
                        ),
                      ),
                      onTap: (){
                        Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN);
                      },
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      child: Container(
                        height: 180.0,
                        width: 180.0,
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
                          child: Image(image: AssetImage("assets/ucc_bunit.png"),fit: BoxFit.cover,),
                        ),
                      ),
                      onTap: (){
                        Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        height: 180.0,
                        width: 180.0,
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
                          child: Image(image: AssetImage("assets/ucc_cunit.png"),fit: BoxFit.cover,),
                        ),
                      ),
                      onTap: (){
                        Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN);
                      },
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      child: Container(
                        height: 180.0,
                        width: 180.0,
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
                          child: Image(image: AssetImage("assets/ucc_dunit.png"),fit: BoxFit.cover,),
                        ),
                      ),
                      onTap: (){
                        Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),

          SizedBox(height: 15),
        ],
      ),
    );
  }
}
