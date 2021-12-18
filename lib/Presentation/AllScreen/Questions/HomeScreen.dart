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
            Padding(
              padding: new EdgeInsets.symmetric(vertical: 7, horizontal: 7),
              child: Container(
                height: 130,
                width: double.infinity,
                decoration: new BoxDecoration(
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
            ),
            Container(
              height: 160,
              width: double.infinity,
              padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              decoration: new BoxDecoration(color: Colors.white),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Container(
                        height: 150.0,
                        width: 90.0,
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: new AssetImage("assets/preparation.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        print("clicked studyabroad");
                        Get.toNamed(AppRoutes.STUDYABROADSCREEN);
                      },
                    ),
                    SizedBox(width: 8),
                    RaisedButton(
                      color: Colors.lightBlueAccent[700],
                      textColor: Colors.white,
                      child: Container(
                        height: 150.0,
                        width: 90.0,
                        child: Center(
                          child: Text(
                            "Scholarship",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        print("clicked tutor");
                        Get.toNamed(AppRoutes.SCHOOLSCREEN);
                      },
                    ),
                    SizedBox(width: 8),
                    RaisedButton(
                      color: Colors.lightBlueAccent[700],
                      textColor: Colors.white,
                      child: Container(
                        height: 150.0,
                        width: 90.0,
                        child: Center(
                          child: Text(
                            "Career Coach",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        print("clicked careercoach");
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
                    RaisedButton(
                      color: Colors.lightBlueAccent[700],
                      textColor: Colors.white,
                      child: Container(
                        height: 150.0,
                        width: 155.0,
                        child: Center(
                          child: Text(
                            "School",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        print("clicked school");
                        Get.toNamed(AppRoutes.SCHOOLSCREEN);
                      },
                    ),
                    SizedBox(width: 8),
                    RaisedButton(
                      color: Colors.lightBlueAccent[700],
                      textColor: Colors.white,
                      child: Container(
                        height: 150.0,
                        width: 155.0,
                        child: Center(
                          child: Text(
                            "College",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        print("clicked college");
                        Get.toNamed(AppRoutes.COLLEGESCREEN);
                      },
                    ),
                  ]),
            ),
            SizedBox(height: 2),
            Container(
              height: 130,
              width: double.infinity,
              padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              decoration: new BoxDecoration(color: Colors.white, boxShadow: [
                new BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15.0,
                ),
              ]),
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Container(
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new AssetImage("assets/preparation.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                onPressed: () {
                  print("clicked university");
                  Get.toNamed(AppRoutes.UNIVERSITYSCREEN);
                },
              ),
            ),
            SizedBox(height: 2),
            Container(
              height: 160,
              width: double.infinity,
              padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              decoration: new BoxDecoration(color: Colors.white, boxShadow: [
                new BoxShadow(
                  color: Colors.grey,
                  blurRadius: 15.0,
                ),
              ]),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Container(
                        height: 150.0,
                        width: 90.0,
                        child: Center(
                          child: Text(
                            "Tutor",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        print("clicked tutor");
                        Get.toNamed(AppRoutes.TUTORSCREEN);
                      },
                    ),
                    SizedBox(width: 8),
                    RaisedButton(
                      color: Colors.lightBlueAccent[700],
                      textColor: Colors.white,
                      child: Container(
                        height: 150.0,
                        width: 90.0,
                        child: Center(
                          child: Text(
                            "Job",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        print("clicked job");
                        Get.toNamed(AppRoutes.JOBSCREEN);
                      },
                    ),
                    SizedBox(width: 8),
                    RaisedButton(
                      color: Colors.lightBlueAccent[700],
                      textColor: Colors.white,
                      child: Container(
                        height: 150.0,
                        width: 90.0,
                        child: Center(
                          child: Text(
                            "Food",
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: () {
                        print("clicked food");
                        Get.toNamed(AppRoutes.FOODSCREEN);
                      },
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
