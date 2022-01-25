import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CareerCoachScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Career Coach",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.toNamed(AppRoutes.ADDCAREERCOACHSCREEN);
          }),
      body: SingleChildScrollView(
        child:
        Column(
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
                        "assets/scholarshipbanner.png",fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.fromLTRB(11.0, 0.0, 11.0, 0.0),
              child:
              Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          width: 175.0,
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
                                height: 175,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image(image: AssetImage("assets/enayetchowdhury.png"),fit: BoxFit.cover,),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("Enayet Chowdhury", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text("Lecturer, BUET", textAlign: TextAlign.center),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                        onTap: (){
                          Get.toNamed(AppRoutes.CAREERCOACHSCREEN2);
                        },

                        onLongPress: (){
                          Get.toNamed(AppRoutes.EDITCAREERCOACHSCREEN);
                        },
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        child: Container(
                          width: 175.0,
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
                                height: 175,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image(image: AssetImage("assets/khalidfarhan.png"),fit: BoxFit.cover,),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("Khalid Farhan", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text("Digital Marketer", textAlign: TextAlign.center),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                        onTap: (){
                          Get.toNamed(AppRoutes.CAREERCOACHSCREEN2);
                        },

                        onLongPress: (){
                          Get.toNamed(AppRoutes.EDITCAREERCOACHSCREEN);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          width: 175.0,
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
                                height: 175,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image(image: AssetImage("assets/sadmansadik.png"),fit: BoxFit.cover,),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("Sadman Sadik", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text("Educator", textAlign: TextAlign.center),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                        onTap: (){
                          Get.toNamed(AppRoutes.CAREERCOACHSCREEN2);
                        },

                        onLongPress: (){
                          Get.toNamed(AppRoutes.EDITCAREERCOACHSCREEN);
                        },
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        child: Container(
                          width: 175.0,
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
                                height: 175,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image(image: AssetImage("assets/simanta.png"),fit: BoxFit.cover,),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("Mashahed Hassan", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                              Text("Soft-skills Trainer", textAlign: TextAlign.center),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                        onTap: (){
                          Get.toNamed(AppRoutes.CAREERCOACHSCREEN2);
                        },

                        onLongPress: (){
                          Get.toNamed(AppRoutes.EDITCAREERCOACHSCREEN);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
