import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/coaching_course_model.dart';
import 'package:BornoBangla/Data/Models/coaching_model.dart';
import 'package:BornoBangla/Presentation/Controllers/coaching_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdmissionCoachingScreen2 extends StatefulWidget {
  @override
  State<AdmissionCoachingScreen2> createState() =>
      _AdmissionCoachingScreen2State();
}

class _AdmissionCoachingScreen2State extends State<AdmissionCoachingScreen2> {
  double? amount;
  double? rupee;
  double? usd;
  CoachingModel coachingModel = Get.arguments;
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
                coachingModel.name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Image(
                    image: NetworkImage(coachingModel.bannerImages),
                  ),
                ),
                SizedBox(height: 18),
                GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  shrinkWrap: true,
                  primary: false,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.70,
                    crossAxisCount: context.width > 550 ? 3 : 2,
                  ),
                  itemBuilder: (context, index) {
                    CoachingCourseModel courseModel = coachingModel.courses[index];
                    return InkWell(
                      child: Container(
                        decoration: new BoxDecoration(
                          border: Border.all(color: Colors.green, width: 1.5),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(13),
                                    topRight: Radius.circular(13)),
                                child: Image(
                                  image: NetworkImage(courseModel.image),
                                ),
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(courseModel.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Regular Fee:  ',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  courseModel.currency.toString(),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  courseModel.regularCourseFee.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(height: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Discount Fee:  ',
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  courseModel.currency.toString(),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  courseModel.discountedCourseFee.toString(),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        CoachingController.to.coachingCourseModel(courseModel);

                        if(courseModel.currency.toString() == "৳")
                          {amount = courseModel.discountedCourseFee?.toDouble();}

                        else if(courseModel.currency.toString() == "₹")
                        {
                          rupee = (courseModel.discountedCourseFee?.toDouble());
                          amount = (rupee!*1.2).toDouble();
                        }

                        else if(courseModel.currency.toString() == "\$")
                        {
                        usd = (courseModel.discountedCourseFee?.toDouble());
                        amount = (usd!*85).toDouble();
                        };


                        Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN,
                            arguments: amount
                        );
                        print(amount);
                      },
                    );
                  },
                  itemCount: coachingModel.courses.length,
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
