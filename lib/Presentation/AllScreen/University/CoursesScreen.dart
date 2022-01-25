import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CoursesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Selected University",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.toNamed(AppRoutes.ADDUNIVERSITYCOURSESCREEN);
          }),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [Container(),
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
                        "assets/scholarshipbanner.png",fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white,
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.7),
                        blurRadius:8, spreadRadius: 0, offset: Offset(0,2))]),
                width: double.infinity,
                child:
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          child: Column(
                            children: [
                              Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.school, color: Colors.red,),
                                  SizedBox(width: 10,),
                                  Text("Course: ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                                  Expanded(
                                    child: Text(
                                        "Civil Engineering",
                                        softWrap: true,
                                        maxLines: 3,
                                        style: TextStyle(fontSize: 18.0,)
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.timer, color: Colors.blue),
                                  SizedBox(width: 10,),
                                  Text("Duration: ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                                  Expanded(
                                    child: Text(
                                        "3 Years",
                                        softWrap: true,
                                        maxLines: 3,
                                        style: TextStyle(fontSize: 18.0,)
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.credit_score, color: Colors.green),
                                  SizedBox(width: 10,),
                                  Text("Admission Fees: ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                                  Expanded(
                                    child: Text(
                                        "200 USD",
                                        softWrap: true,
                                        maxLines: 3,
                                        style: TextStyle(fontSize: 18.0,)
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.paid, color: Colors.pink),
                                  SizedBox(width: 10,),
                                  Text("Tuition Fees: ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                                  Expanded(
                                    child: Text(
                                        "2000 USD",
                                        softWrap: true,
                                        maxLines: 3,
                                        style: TextStyle(fontSize: 18.0,)
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onLongPress: (){
                          Get.toNamed(AppRoutes.EDITCOURSESCREEN);
                        },
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: 197,
                        child: RaisedButton(
                          elevation: 0,
                          color: Colors.green,
                          textColor: Colors.white,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(12.0),
                          ),
                          onPressed: () {
                            Get.toNamed(AppRoutes.SCHOLARSHIPAPPLYSCREEN);
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Text(
                                  "Apply for Proicessing",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white,
                    border: Border.all(color: Colors.green, width: 2),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.7),
                        blurRadius:8, spreadRadius: 0, offset: Offset(0,2))]),
                width: double.infinity,
                child:
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      InkWell(
                        child: Container(
                          child: Column(
                            children: [
                              Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.school, color: Colors.red,),
                                  SizedBox(width: 10,),
                                  Text("Course: ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                                  Expanded(
                                    child: Text(
                                        "Electrical Engineering",
                                        softWrap: true,
                                        maxLines: 3,
                                        style: TextStyle(fontSize: 18.0,)
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.timer, color: Colors.blue),
                                  SizedBox(width: 10,),
                                  Text("Duration: ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                                  Expanded(
                                    child: Text(
                                        "4 Years",
                                        softWrap: true,
                                        maxLines: 3,
                                        style: TextStyle(fontSize: 18.0,)
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.credit_score, color: Colors.green),
                                  SizedBox(width: 10,),
                                  Text("Admission Fees: ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                                  Expanded(
                                    child: Text(
                                        "250 USD",
                                        softWrap: true,
                                        maxLines: 3,
                                        style: TextStyle(fontSize: 18.0,)
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.paid, color: Colors.pink),
                                  SizedBox(width: 10,),
                                  Text("Tuition Fees: ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                                  Expanded(
                                    child: Text(
                                        "3000 USD",
                                        softWrap: true,
                                        maxLines: 3,
                                        style: TextStyle(fontSize: 18.0,)
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onLongPress: (){
                          Get.toNamed(AppRoutes.EDITCOURSESCREEN);
                        },
                      ),
                      SizedBox(height: 20,),
                      Container(
                        width: 197,
                        child: RaisedButton(
                          elevation: 0,
                          color: Colors.green,
                          textColor: Colors.white,
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(12.0),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Text(
                                  "Apply for Proicessing",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
}
