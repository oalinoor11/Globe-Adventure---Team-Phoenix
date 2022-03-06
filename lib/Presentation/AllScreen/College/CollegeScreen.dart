import 'dart:convert';

import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/firebase_collections.dart';
import 'package:BornoBangla/Presentation/Controllers/college_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CollegeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "College",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.toNamed(AppRoutes.ADDCOUNTRYSCREEN);
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
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
                        "assets/scholarshipbanner.png",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 18),
            StreamBuilder(
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> country =
                            snapshot.data!.docs[index].data()
                                as Map<String, dynamic>;
                        return InkWell(
                          child: Container(
                            decoration: new BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  blurRadius: 5.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: 80,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image(
                                      image:
                                          NetworkImage(country['countryFlag']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(country['countryName'],
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                              ],
                            ),
                          ),
                          onTap: () {
                            CollegeController.to
                                .selectedCountry(country['countryName']);
                            Get.toNamed(AppRoutes.COLLEGESCREEN2);
                          },
                          onLongPress: () {
                            Get.toNamed(AppRoutes.EDITCOUNTRYSCREEN);
                          },
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: context.width > 1080 ? 4 : 3,),
                      // itemCount: (snapshot.data as QuerySnapshot).documents.length,) ,
                      itemCount: snapshot.data?.docs.length ?? 0,
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
                stream: FirebaseCollections.COUNTRYCOLLECTION.snapshots()),
          ],
        ),
      ),
    );
  }
}
