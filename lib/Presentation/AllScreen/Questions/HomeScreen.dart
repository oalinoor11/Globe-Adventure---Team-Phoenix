import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:carousel_pro/carousel_pro.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title:
            // Image.asset("assets/logo.png", height: 130),
            Text(
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
              child: Image.asset("assets/banner1.png", fit: BoxFit.cover),
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
            SizedBox(height: 6),
            Container(
              height: 160,
              width: double.infinity,
              padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              decoration: new BoxDecoration(color: Colors.white),
              child: InkWell(
                child: Container(
                  width: double.infinity,
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
                    child: Image(image: AssetImage("assets/preparation.png"),fit: BoxFit.cover,),
                  ),
                ),
                onTap: (){
                  Get.toNamed(AppRoutes.PREPARATIONSCREEN);
                },
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 160,
              width: double.infinity,
              padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              decoration: new BoxDecoration(color: Colors.white),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        height: 150.0,
                        width: 122.0,
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
                          child: Image(image: AssetImage("assets/studyabroad.png"),fit: BoxFit.cover,),
                        ),
                      ),
                      onTap: (){
                        Get.toNamed(AppRoutes.STUDYABROADSCREEN);
                      },
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      child: Container(
                        height: 150.0,
                        width: 122.0,
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
                          child: Image(image: AssetImage("assets/scholarship.png"),fit: BoxFit.cover,),
                        ),
                      ),
                      onTap: (){
                        Get.toNamed(AppRoutes.APPLYSCHOLARSHIPSCREEN);
                      },
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      child: Container(
                        height: 150.0,
                        width: 122.0,
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
                          child: Image(image: AssetImage("assets/careercoach.png"),fit: BoxFit.cover,),
                        ),
                      ),
                      onTap: (){
                        Get.toNamed(AppRoutes.CAREERCOACHSCREEN);
                      },
                    ),
                  ]),
            ),
            SizedBox(height: 5),
            Container(
              height: 160,
              width: double.infinity,
              padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              decoration: new BoxDecoration(color: Colors.white),
              child: new Row(
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
                          child: Image(image: AssetImage("assets/school.png"),fit: BoxFit.cover,),
                        ),
                      ),
                      onTap: (){
                        Get.toNamed(AppRoutes.SCHOOLSCREEN);
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
                          child: Image(image: AssetImage("assets/college.png"),fit: BoxFit.cover,),
                        ),
                      ),
                      onTap: (){
                        Get.toNamed(AppRoutes.COLLEGESCREEN);
                      },
                    ),
                  ]),
            ),
            SizedBox(height: 5),
            Container(
              height: 160,
              width: double.infinity,
              padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              decoration: new BoxDecoration(color: Colors.white),
              child: InkWell(
                child: Container(
                  width: double.infinity,
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
                    child: Image(image: AssetImage("assets/university.png"),fit: BoxFit.cover,),
                  ),
                ),
                onTap: (){
                  Get.toNamed(AppRoutes.UNIVERSITYSCREEN);
                },
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 160,
              width: double.infinity,
              padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              decoration: new BoxDecoration(color: Colors.white),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        height: 150.0,
                        width: 122.0,
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
                          child: Image(image: AssetImage("assets/tutor.png"),fit: BoxFit.cover,),
                        ),
                      ),
                      onTap: (){
                        Get.toNamed(AppRoutes.TUTORSCREEN);
                      },
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      child: Container(
                        height: 150.0,
                        width: 122.0,
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
                          child: Image(image: AssetImage("assets/job.png"),fit: BoxFit.cover,),
                        ),
                      ),
                      onTap: (){
                        Get.toNamed(AppRoutes.JOBSCREEN);
                      },
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      child: Container(
                        height: 150.0,
                        width: 122.0,
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
                          child: Image(image: AssetImage("assets/food.png"),fit: BoxFit.cover,),
                        ),
                      ),
                      onTap: (){
                        Get.toNamed(AppRoutes.FOODSCREEN);
                      },
                    ),
                  ]),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
