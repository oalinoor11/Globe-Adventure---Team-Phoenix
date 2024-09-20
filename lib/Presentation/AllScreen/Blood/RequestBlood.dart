import 'dart:math';

import 'package:durbarclub/Data/Models/BloodrequestModel.dart';
import 'package:durbarclub/Presentation/AllScreen/Notification/sendFCMMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:country_dial_code/country_dial_code.dart';
import 'package:intl/intl.dart';

import '../../../AllWidgets/progressDialog.dart';
import '../../../Controllers/profile_controller.dart';
import '../../../Core/AppRoutes.dart';
import '../../../Core/appData.dart';
import '../../../Data/Models/profile_model.dart';

class RequestBlood extends StatefulWidget {

  @override
  State<RequestBlood> createState() => _RequestBloodState();
}

class _RequestBloodState extends State<RequestBlood> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String bloodGroup = "";
  String bloodGroupFactor = "";
  TextEditingController bagsTextEditingController = TextEditingController();
  TextEditingController locationTextEditingController = TextEditingController();
  TextEditingController timeTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController descriptionTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: MediaQuery.of(context).padding.top, color: Colors.transparent,),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(child: Text("Blood Request Form", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Select Blood Group", style: TextStyle(fontSize: 16.0, color: Colors.grey),),
                        ],
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              setState(() {
                                bloodGroup = "A";
                              });
                            },
                            child: Container(
                              height: 55.0,
                              width: (Get.width-72)/4.5,
                              decoration: BoxDecoration(
                                color: bloodGroup == "A" ? Colors.red : Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: bloodGroup == "A" ? Colors.red : Colors.grey.withOpacity(0.5), width: 1),
                              ),
                              child: Center(child: Text("A", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: bloodGroup == "A" ? Colors.white : Colors.black),)),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              setState(() {
                                bloodGroup = "B";
                              });
                            },
                            child: Container(
                              height: 55.0,
                              width: (Get.width-72)/4.5,
                              decoration: BoxDecoration(
                                color: bloodGroup == "B" ? Colors.red : Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: bloodGroup == "B" ? Colors.red : Colors.grey.withOpacity(0.5), width: 1),
                              ),
                              child: Center(child: Text("B", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: bloodGroup == "B" ? Colors.white : Colors.black),)),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              setState(() {
                                bloodGroupFactor = "+";
                              });
                            },
                            child: Container(
                              height: 55.0,
                              width: ((Get.width-72)/4.5)*2,
                              decoration: BoxDecoration(
                                color: bloodGroupFactor == "+" ? Colors.red : Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: bloodGroupFactor == "+" ? Colors.red : Colors.grey.withOpacity(0.5), width: 1),
                              ),
                              child: Center(child: Text("+", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: bloodGroupFactor == "+" ? Colors.white : Colors.black),)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: ((Get.width-72) - (((Get.width-72)/4.5)*4))/2),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () async {
                              setState(() {
                                bloodGroup = "AB";
                              });
                            },
                            child: Container(
                              height: 55.0,
                              width: (Get.width-72)/4.5,
                              decoration: BoxDecoration(
                                color: bloodGroup == "AB" ? Colors.red : Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: bloodGroup == "AB" ? Colors.red : Colors.grey.withOpacity(0.5), width: 1),
                              ),
                              child: Center(child: Text("AB", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: bloodGroup == "AB" ? Colors.white : Colors.black),)),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              setState(() {
                                bloodGroup = "O";
                              });
                            },
                            child: Container(
                              height: 55.0,
                              width: (Get.width-72)/4.5,
                              decoration: BoxDecoration(
                                color: bloodGroup == "O" ? Colors.red : Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: bloodGroup == "O" ? Colors.red : Colors.grey.withOpacity(0.5), width: 1),
                              ),
                              child: Center(child: Text("O", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: bloodGroup == "O" ? Colors.white : Colors.black),)),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              setState(() {
                                bloodGroupFactor = "-";
                              });
                            },
                            child: Container(
                              height: 55.0,
                              width: ((Get.width-72)/4.5)*2,
                              decoration: BoxDecoration(
                                color: bloodGroupFactor == "-" ? Colors.red : Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: bloodGroupFactor == "-" ? Colors.red : Colors.grey.withOpacity(0.5), width: 1),
                              ),
                              child: Center(child: Text("−", style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: bloodGroupFactor == "-" ? Colors.white : Colors.black),)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 14.0,
                            ),
                            Expanded(
                              child: TextField(
                                controller: bagsTextEditingController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "How many bags?",
                                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10.0,
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 14.0,
                            ),
                            Expanded(
                              child: TextField(
                                controller: locationTextEditingController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Location",
                                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10.0,
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 14.0,
                            ),
                            Expanded(
                              child: TextField(
                                controller: timeTextEditingController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "When you need?",
                                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10.0,
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 14.0,
                            ),
                            Expanded(
                              child: TextField(
                                controller: phoneTextEditingController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Phone Number",
                                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10.0,
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 14.0,
                            ),
                            Expanded(
                              child: TextField(
                                minLines: 3,
                                maxLines: 3,
                                controller: descriptionTextEditingController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Details",
                                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.grey),
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10.0,
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () async {
                  if (phoneTextEditingController.text.length < 10) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Enter Phone", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                      ),
                    );
                  } else if (
                      bloodGroup == "" ||
                      bloodGroupFactor == "" ||
                      bagsTextEditingController.text.isEmpty ||
                      locationTextEditingController.text.isEmpty ||
                      timeTextEditingController.text.isEmpty ||
                      descriptionTextEditingController.text.isEmpty
                  ) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Please fillup all fields", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                      ),
                    );
                  }
                  else {
                    await BloodRequestModel(
                      bloodGroup: "${bloodGroup+bloodGroupFactor}",
                      bags: "${bagsTextEditingController.text}",
                      location: "${locationTextEditingController.text}",
                      time: "${timeTextEditingController.text}",
                      phone: "${phoneTextEditingController.text}",
                      description: "${descriptionTextEditingController.text}",
                      timeStamps: "${DateTime.now().millisecondsSinceEpoch}",
                      requestedById: ProfileController.to.profile.value!.id.toString(),
                      requestedByName: ProfileController.to.profile.value!.name.toString(),
                      status: 'Pending',
                      statusDetails: '',
                      donnerId: '',
                      donnerName: '',
                      donnerPhone: '',
                      donnerImage: '',
                    )..save();
                    sendFCMMessage("জরুরি রক্ত প্রয়োজন", "জরুরি ভিত্তিতে ${bagsTextEditingController.text} ব্যাগ ${bloodGroup+bloodGroupFactor} রক্ত লাগবে।\nসময়: ${timeTextEditingController.text}\nলোকেশন: ${locationTextEditingController.text}", "all");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.green,
                        content: Text(
                          "Request Submitted", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                      ),
                    );
                    Get.back();
                  }
                },
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration( color: primaryColor, borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: Text(
                      "Submit Request",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
