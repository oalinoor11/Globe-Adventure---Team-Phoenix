import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/coaching_course_model.dart';
import 'package:BornoBangla/Data/Models/coaching_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AdmissionCoachingScreen2 extends StatefulWidget {
  @override
  State<AdmissionCoachingScreen2> createState() =>
      _AdmissionCoachingScreen2State();
}

class _AdmissionCoachingScreen2State extends State<AdmissionCoachingScreen2> {
  CoachingModel coachingModel = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          coachingModel.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            await Get.toNamed(AppRoutes.ADDCOURSESCREEN,
                arguments: coachingModel);
            setState(() {
              coachingModel;
            });
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
            items: coachingModel.bannerImages.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    child: Image.network(
                      i,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          GridView.builder(
            shrinkWrap: true,
            primary: false,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) {
              CoachingCourseModel courseModel = coachingModel.courses[index];
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
                            image: NetworkImage(courseModel.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(courseModel.name,
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text(courseModel.regularCourseFee.toString(),
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text(courseModel.discountedCourseFee.toString(),
                          textAlign: TextAlign.center,
                          style:
                          TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
                onTap: () {
                  Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN);
                },
              );
            },
            itemCount: coachingModel.courses.length,
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
