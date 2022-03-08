import 'dart:math';

import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/coaching_model.dart';
import 'package:BornoBangla/Data/firebase_collections.dart';
import 'package:BornoBangla/Presentation/Controllers/coaching_controller.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdmissionCoachingScreen extends StatefulWidget {
  @override
  State<AdmissionCoachingScreen> createState() =>
      _AdmissionCoachingScreenState();
}

class _AdmissionCoachingScreenState extends State<AdmissionCoachingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.92),
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title:
            // Image.asset("assets/logo.png", height: 130),
            Text(
          "Admission Coaching",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.toNamed(AppRoutes.ADDCOACHINGSCREEN);
          }),
      body: Column(
        children: [
          SizedBox(height: 15),
          Expanded(
            child: StreamBuilder<List<CoachingModel>>(
                stream: CoachingModel.getCoachingList(
                    CoachingController.to.selectedType()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 1 / 1,
                          crossAxisCount: context.width > 1080 ? 4 : 2,
                        ),
                        itemBuilder: (context, index) {
                          var coaching = snapshot.data![index];
                          return InkWell(
                            child: Container(
                              decoration: new BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                border:
                                    Border.all(color: Colors.green, width: 1.5),
                                image: DecorationImage(
                                    image: NetworkImage(coaching.image)),
                                // boxShadow: [
                                //   new BoxShadow(
                                //     color: Colors.black.withOpacity(1),
                                //     blurRadius: 5.0,
                                //   ),
                                // ],
                              ),
                              child: Stack(children: [
                                Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(13),
                                            bottomRight: Radius.circular(13),
                                          ),
                                          color: Colors.green.withOpacity(0.93),
                                        ),
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.all(7.0),
                                          child: Text(
                                            coaching.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                          ),
                                        )))),
                              ]),
                            ),
                            onTap: () {
                              Get.toNamed(AppRoutes.ADMISSIONCOACHINGSCREEN2,
                                  arguments: coaching);
                            },
                            onLongPress: () {
                              Get.toNamed(AppRoutes.EDITCOACHINGSCREEN,
                                  arguments: coaching);
                            },
                          );
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
