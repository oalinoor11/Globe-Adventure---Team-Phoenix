import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.2),
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title:
            Text(
          "Borno Bangla",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
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
                            "assets/banner1.png",
                            fit: BoxFit.cover,
                          ),
                      );
                    },
                  );
                }).toList(),
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
                    child: Image(image: AssetImage("assets/preparation.png"), fit: BoxFit.cover,),
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
                        width: 118.0,
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
                        width: 118.0,
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
                        width: 118.0,
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
                  Get.toNamed(AppRoutes.STUDYABROADSCREEN);
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
                        width: 118.0,
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
                        width: 118.0,
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
                        width: 118.0,
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
                          child: Image(image: AssetImage("assets/BOOK.png"),fit: BoxFit.cover,),
                        ),
                      ),
                      onTap: (){
                        Get.toNamed(AppRoutes.BOOKSCREEN);
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
