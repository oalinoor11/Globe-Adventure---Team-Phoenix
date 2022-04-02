import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/course_model.dart';
import 'package:BornoBangla/Data/Models/university_model.dart';
import 'package:BornoBangla/Presentation/Controllers/scholarship_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CoursesScreen extends StatefulWidget {
  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  UniversityModel universityModel = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: context.width > 550 ? BoxDecoration(border: Border.all(width: 2, color: Colors.grey.withOpacity(0.35))): null,
        width: context.width > 550 ? 550 : double.infinity,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            title: Center(
              child: Text(
                universityModel.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(),
                Container(
                  child: Image(
                    image: NetworkImage(universityModel.bannerImages),
                  ),
                ),
                SizedBox(height: 10),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: universityModel.courseList.length,
                  itemBuilder: (context, index) {
                    CourseModel courseModel = universityModel.courseList[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18, top: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  blurRadius: 8,
                                  spreadRadius: 0,
                                  offset: Offset(0, 2))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              InkWell(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.auto_stories,
                                            color: Colors.red,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Course: ",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold)),
                                          Expanded(
                                            child: Text(courseModel.name,
                                                softWrap: true,
                                                maxLines: 3,
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                )),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.timer, color: Colors.blue),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Duration: ",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold)),
                                          Expanded(
                                            child: Text(courseModel.duration,
                                                softWrap: true,
                                                maxLines: 3,
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                )),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.poll, color: Colors.green),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Level: ",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold)),
                                          Expanded(
                                            child: Text(courseModel.level,
                                                softWrap: true,
                                                maxLines: 3,
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                )),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.history_edu,
                                              color: Colors.red),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Requirements: ",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold)),
                                          Expanded(
                                            child: Text(courseModel.requirements,
                                                softWrap: true,
                                                maxLines: 3,
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                )),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.school, color: Colors.blue),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Scholarship: ",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold)),
                                          Expanded(
                                            child: Text(courseModel.scholarship,
                                                softWrap: true,
                                                maxLines: 3,
                                                style: TextStyle(
                                                  fontSize: 18.0,
                                                )),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.credit_score,
                                              color: Colors.green),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Admission Fees:  ",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              courseModel.currency.toString(),
                                              softWrap: true,
                                              maxLines: 3,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                              )),
                                          Text(
                                            courseModel.admissionFees.toString(),
                                              softWrap: true,
                                              maxLines: 3,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                              )),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.paid, color: Colors.pink),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Tuition Fees: ",
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              courseModel.currency.toString(),
                                              softWrap: true,
                                              maxLines: 3,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                              )),
                                          Text(
                                              courseModel.tuitionFees.toString(),
                                              softWrap: true,
                                              maxLines: 3,
                                              style: TextStyle(
                                                fontSize: 18.0,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
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
                                    ScholarshipController.to.course(courseModel);
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
                    );

                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
