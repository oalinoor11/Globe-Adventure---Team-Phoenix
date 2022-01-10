import 'dart:math';

import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Presentation/AllScreen/FirebaseCollections.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdmissionCoachingScreen extends StatefulWidget {
  @override
  State<AdmissionCoachingScreen> createState() => _AdmissionCoachingScreenState();
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
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseCollections.ADMISSIONCOACHING.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var coachingList = snapshot.data!.docs;
                    return GridView.builder(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          itemCount: coachingList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 1 / 1,
                            crossAxisCount: context.width > 1080 ? 4 : 2,
                          ),
                          itemBuilder: (context, index) {
                            var coaching = coachingList[index].data() as Map<String, dynamic>;
                            return InkWell(
                              child: Container(
                                decoration: new BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: Colors.green, width: 1.5),
                                  image: DecorationImage(
                                      image: NetworkImage(coaching['image'])),
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
                                            color:
                                                Colors.green.withOpacity(0.93),
                                          ),
                                          child: Center(
                                              child: Padding(
                                            padding: const EdgeInsets.all(7.0),
                                            child: Text(
                                              coaching['title'],
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
                                Get.toNamed(AppRoutes.UCCSCREEN);
                              },
                              onLongPress: () {

                                var result = CoolAlert.show(
                                  backgroundColor: Colors.green,
                                  confirmBtnColor: Colors.red,
                                  confirmBtnText: ("Delete"),
                                  width: 10,
                                  context: context,
                                  type: CoolAlertType.confirm,
                                  onCancelBtnTap: () =>
                                      Get.back(result: false),
                                  onConfirmBtnTap: () =>
                                      Get.back(result: true),
                                );
                                // if (result) {
                                //   var response =
                                //       await MaterialRepository()
                                //       .deleteMaterial(e);
                                //   if (response) {
                                //     await CoolAlert.show(
                                //         context: context,
                                //         type: CoolAlertType.success);
                                //   } else {
                                //     await CoolAlert.show(
                                //         context: context,
                                //         type: CoolAlertType.error);
                                //   }
                                // }
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
