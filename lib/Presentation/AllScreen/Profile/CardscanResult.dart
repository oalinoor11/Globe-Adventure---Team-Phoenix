import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
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

class CardscanResult extends StatefulWidget {

  @override
  State<CardscanResult> createState() => _CardscanResultState();
}

class _CardscanResultState extends State<CardscanResult> {

  DateFormat dateFormat = DateFormat("MMMM d, yyyy");

  String cardData = Get.arguments;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  int showpass = 0;
  int showpass2 = 0;

  bool sameAddress = false;

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController firstnameTextEditingController = TextEditingController();
  String photoId = "";
  String image = "";
  String bloodGroup = "";
  String bloodGroupFactor = "";
  TextEditingController professionTextEditingController = TextEditingController();
  TextEditingController workplaceTextEditingController = TextEditingController();
  TextEditingController dobTextEditingController = TextEditingController();
  TextEditingController bloodTextEditingController = TextEditingController();
  TextEditingController presentAddressTextEditingController = TextEditingController();
  TextEditingController permanentAddressTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController designationTextEditingController = TextEditingController();
  TextEditingController signedUpTextEditingController = TextEditingController();
  TextEditingController validityTextEditingController = TextEditingController();
  String status = "";
  String statusDetails = "";
  String validity = "";
  String verified = "";
  String memberId = "";
  TextEditingController emergencyContactPerson = TextEditingController();
  TextEditingController emergencyContactRelation = TextEditingController();
  TextEditingController emergencyContactPhone = TextEditingController();
  String role = "";
  String signedUp = "";

  String countryCode = "";

  @override
  void initState() {
    findProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return firstnameTextEditingController.text == "" ? Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/carddataloading.gif"),
      )
    ) : firstnameTextEditingController.text == "invalid" ? Scaffold(
        backgroundColor: Colors.white,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(status, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),),
            Image.asset("assets/invalidcard.png"),
          ],
        )
    ) : Scaffold(
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
                  child: Center(child: Text("Durbar ID: $memberId", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
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
                      GestureDetector(
                        child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: <Widget> [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: new BoxDecoration(
                                  border:
                                  Border.all(color: Colors.blue, width: 1.5),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.network(image)),
                              ),
                              verified == "true" ? Positioned(
                                left: 65,
                                top: 70,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: new BoxDecoration(
                                    boxShadow: [
                                      new BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 0,
                                      ),
                                    ],
                                    border: Border.all(color: primaryColor, width: 1),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Container(child: Icon(Icons.verified, size: 20, color: Colors.blue,)),
                                ),
                              ) : SizedBox(),
                            ]
                        ),
                      ),
                      SizedBox(height: 20,),
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
                                readOnly: true,
                                controller: firstnameTextEditingController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Name",
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
                                readOnly: true,
                                controller: designationTextEditingController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Designation",
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
                                readOnly: true,
                                controller: phoneTextEditingController,
                                keyboardType: TextInputType.phone,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Phone",
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
                                readOnly: true,
                                controller: emailTextEditingController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Email",
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
                                readOnly: true,
                                controller: signedUpTextEditingController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Member Since",
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
                                readOnly: true,
                                controller: validityTextEditingController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Valid Till",
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
                                readOnly: true,
                                controller: dobTextEditingController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Date of Birth",
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
                                readOnly: true,
                                controller: bloodTextEditingController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Blood Group",
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
                height: 10.0,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: <Widget> [
                              Container(
                                height: Get.width/2.2,
                                width: double.infinity,
                                decoration: new BoxDecoration(
                                  border:
                                  Border.all(color: Colors.blue, width: 1.5),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(9),
                                    child: Image.network(photoId, fit: BoxFit.cover,)),
                              ),
                            ]
                        ),
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
                                readOnly: true,
                                controller: professionTextEditingController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Profession",
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
                                readOnly: true,
                                controller: workplaceTextEditingController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Workplace/Institute",
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
                                readOnly: true,
                                controller: presentAddressTextEditingController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Present Address",
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
                                readOnly: true,
                                controller: permanentAddressTextEditingController,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  // suffix: Checkbox(
                                  //   value: sameAddress,
                                  //   onChanged: (bool? value) {
                                  //     setState(() {
                                  //       if(sameAddress){
                                  //         sameAddress = false;
                                  //         permanentAddressTextEditingController.text = "";
                                  //       } else {
                                  //         sameAddress = true;
                                  //         permanentAddressTextEditingController.text = presentAddressTextEditingController.text;
                                  //       }
                                  //     });
                                  //   },
                                  // ),
                                  border: InputBorder.none,
                                  labelText: "Permanent Address",
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
                                readOnly: true,
                                controller: emergencyContactPerson,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Emergency Contact Person",
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
                                readOnly: true,
                                controller: emergencyContactRelation,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Relation with Person",
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
                                readOnly: true,
                                controller: emergencyContactPhone,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  labelText: "Emergency Contact Phone",
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
            ],
          ),
        ),
      ),
    );
  }

  findProfile() async {
    await Future.delayed(Duration(milliseconds: 100));
    final querySnapshot = await FirebaseFirestore.instance
        .collection('PROFILELIST')
        .get();
    final documents = querySnapshot.docs.where((doc) => doc['memberId'] == cardData).toList();
    if(documents.length < 1){
      setState(() {
        firstnameTextEditingController.text = "invalid";
        status = "Invalid Card";
      });
    }
    else{
      if(documents.first.data()["status"].toString() != "Active"){
        setState(() {
          firstnameTextEditingController.text = "invalid";
          status = documents.first.data()["statusDetails"];
        });
      }
      else{
        setState(() {
          firstnameTextEditingController.text = documents.first.data()["name"];
          image = documents.first.data()["image"];
          photoId = documents.first.data()["photoID"];
          phoneTextEditingController.text = documents.first.data()["phone"].toString();
          designationTextEditingController.text = documents.first.data()["designation"].toString();
          emailTextEditingController.text = documents.first.data()["email"];
          professionTextEditingController.text = documents.first.data()["profession"];
          workplaceTextEditingController.text = documents.first.data()["workplace"];
          presentAddressTextEditingController.text = documents.first.data()["presentAddress"];
          permanentAddressTextEditingController.text = documents.first.data()["permanentAddress"];
          emergencyContactPerson.text = documents.first.data()["emergencyContactPerson"];
          emergencyContactRelation.text = documents.first.data()["emergencyContactRelation"];
          emergencyContactPhone.text = documents.first.data()["emergencyContactPhone"];
          dobTextEditingController.text = documents.first.data()["dob"];
          bloodTextEditingController.text = documents.first.data()["bloodGroup"];
          signedUpTextEditingController.text = dateFormat.format(DateTime.fromMicrosecondsSinceEpoch((int.parse(documents.first.data()["signedUp"].toString()))*1000));
          validityTextEditingController.text = dateFormat.format(DateTime.fromMicrosecondsSinceEpoch((int.parse(documents.first.data()["validity"].toString()))*1000));
          memberId = documents.first.data()["memberId"];
          verified = documents.first.data()["verified"];
        });
      }
      print(documents.first.data()["name"]);
    }
  }
}
