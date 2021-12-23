import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class Englisha2zScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "EnglishA2Z",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                        "assets/samplebanner.png",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            Container(
              height: 328,
              width: double.infinity,
              padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              decoration: new BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Container(
                            height: 150.0,
                            width: 187.0,
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
                              child: Image(image: AssetImage("assets/samplecourse.png"),fit: BoxFit.cover,),
                            ),
                          ),
                          onTap: (){
                            Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN);
                          },
                        ),
                        SizedBox(width: 8),
                        InkWell(
                          child: Container(
                            height: 150.0,
                            width: 187.0,
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
                              child: Image(image: AssetImage("assets/samplecourse.png"),fit: BoxFit.cover,),
                            ),
                          ),
                          onTap: (){
                            Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN);
                          },
                        ),
                      ]),
                  SizedBox(height: 8),
                  new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Container(
                            height: 150.0,
                            width: 187.0,
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
                              child: Image(image: AssetImage("assets/samplecourse.png"),fit: BoxFit.cover,),
                            ),
                          ),
                          onTap: (){
                            Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN);
                          },
                        ),
                        SizedBox(width: 8),
                        InkWell(
                          child: Container(
                            height: 150.0,
                            width: 187.0,
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
                              child: Image(image: AssetImage("assets/samplecourse.png"),fit: BoxFit.cover,),
                            ),
                          ),
                          onTap: (){
                            Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN);
                          },
                        ),
                      ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
