import 'dart:math';

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

class SignupScreen extends StatefulWidget {

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  int showpass = 0;
  int showpass2 = 0;

  bool sameAddress = false;

  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmPasswordTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController firstnameTextEditingController = TextEditingController();
  File? photoId;
  File? image;
  String bloodGroup = "";
  String bloodGroupFactor = "";
  TextEditingController professionTextEditingController = TextEditingController();
  TextEditingController workplaceTextEditingController = TextEditingController();
  TextEditingController dobTextEditingController = TextEditingController();
  TextEditingController presentAddressTextEditingController = TextEditingController();
  TextEditingController permanentAddressTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  String status = "";
  String statusDetails = "";
  String validity = "";
  String verified = "";
  String designation = "";
  String memberId = "";
  TextEditingController emergencyContactPerson = TextEditingController();
  TextEditingController emergencyContactRelation = TextEditingController();
  TextEditingController emergencyContactPhone = TextEditingController();
  String role = "";
  String signedUp = "";

  String countryCode = "+880";

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
                  child: Center(child: Text("Create your Durbar ID", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
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
                        onTap: () async {
                          var pickedFile = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (pickedFile != null) {
                            setState(() {
                              image = File(pickedFile.path);
                            });
                          }
                        },
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
                                child: image == null ?
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.asset("assets/personplaceholder.png", fit: BoxFit.cover,),
                                  ),
                                )
                                    : ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.file(image!)),
                              ),
                              Positioned(
                                left: 65,
                                top: 70,
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: new BoxDecoration(
                                    boxShadow: [
                                      new BoxShadow(
                                        color: primaryColor,
                                        blurRadius: 0,
                                      ),
                                    ],
                                    border: Border.all(color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Container(child: Icon(Icons.photo_camera, size: 16, color: Colors.white,)),
                                ),
                              ),
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
                              width: 4.0,
                            ),
                            CountryDialCodePicker(
                              initialSelection: 'BD',
                              flagImageSettings: FlagImageSettings(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              bottomSheetSettings: BottomSheetSettings(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                searchTextStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  countryCode = value.dialCode;
                                });
                                print(countryCode);
                              },
                            ),
                            Expanded(
                              child: TextField(
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
                      InkWell(
                        onTap: () async {
                          _selectDOB(context);
                        },
                        child: Container(
                          height: 55.0,
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
                              Text(_logSubmitDate.toString().split(" ")[0] == DateTime.now().toString().split(" ")[0] ? "Date of Birth" : "${dateFormat.format(_logSubmitDate)}", style: TextStyle(fontSize: 16.0, color: _logSubmitDate.toString().split(" ")[0] == DateTime.now().toString().split(" ")[0] ? Colors.grey : Colors.black),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
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
                        onTap: () async {
                          var pickedFile = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (pickedFile != null) {
                            setState(() {
                              photoId = File(pickedFile.path);
                            });
                          }
                        },
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
                                child: photoId == null ?
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(9),
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Image.asset("assets/nidplaceholder.png", fit: BoxFit.cover,),
                                  ),
                                )
                                    : ClipRRect(
                                    borderRadius: BorderRadius.circular(9),
                                    child: Image.file(photoId!, fit: BoxFit.cover,)),
                              ),
                              Positioned(
                                bottom: 20,
                                right: 20,
                                child: Container(
                                  height: 40,
                                  width: 40,
                                  decoration: new BoxDecoration(
                                    boxShadow: [
                                      new BoxShadow(
                                        color: primaryColor,
                                        blurRadius: 0,
                                      ),
                                    ],
                                    border: Border.all(color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Container(child: Icon(Icons.photo_camera, size: 19, color: Colors.white,)),
                                ),
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
                      AutofillGroup(
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
                                      autofillHints:const [AutofillHints.newUsername],
                                      controller: emailTextEditingController,
                                      keyboardType: TextInputType.emailAddress,
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
                                      autofillHints:const [AutofillHints.newPassword],
                                      controller: passwordTextEditingController,
                                      obscureText: showpass == 0 ? true : false,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                          icon:
                                          showpass == 0 ? Icon(Icons.visibility, size: 25, color: Colors.grey,)
                                              : Icon(Icons.visibility, size: 25, color: primaryColor),
                                          onPressed: () {
                                            setState(() {
                                              showpass == 0 ? showpass = 1 : showpass = 0;
                                            });
                                          },
                                        ),
                                        labelText: "Password",
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
                                      autofillHints:const [AutofillHints.newPassword],
                                      controller: confirmPasswordTextEditingController,
                                      obscureText: showpass2 == 0 ? true : false,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        suffixIcon: IconButton(
                                          icon:
                                          showpass2 == 0 ? Icon(Icons.visibility, size: 25, color: Colors.grey,)
                                              : Icon(Icons.visibility, size: 25, color: primaryColor),
                                          onPressed: () {
                                            setState(() {
                                              showpass2 == 0 ? showpass2 = 1 : showpass2 = 0;
                                            });
                                          },
                                        ),
                                        labelText: "Confirm Password",
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
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: (){
                  if (firstnameTextEditingController.text.length < 3) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Enter Name", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                      ),
                    );
                  } else if (phoneTextEditingController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Enter Phone", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                      ),
                    );
                  } else if (!emailTextEditingController.text
                      .contains("@")) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Invalid Email", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                      ),
                    );
                  } else if (passwordTextEditingController.text.length < 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Set a strong Password", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                      ),
                    );
                  } else if (passwordTextEditingController.text != confirmPasswordTextEditingController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          "Password not match", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                      ),
                    );
                  } else if (
                  photoId == null ||
                  image == null ||
                  bloodGroup == "" ||
                  bloodGroupFactor == "" ||
                  professionTextEditingController.text.isEmpty ||
                  workplaceTextEditingController.text.isEmpty ||
                  dobTextEditingController.text.isEmpty ||
                  permanentAddressTextEditingController.text.isEmpty ||
                  presentAddressTextEditingController.text.isEmpty ||
                  emergencyContactPerson.text.isEmpty ||
                  emergencyContactRelation.text.isEmpty ||
                  emergencyContactPhone.text.isEmpty
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
                    registerNewUser(context);
                  }
                },
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration( color: primaryColor, borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              TextButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.LOGINSCREEN);
                  print("clicked to go signup");
                },
                child: Text(
                  "Already have an account? Login here",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(message: "Creating Durbar ID, Please wait...",);
        });

    final User? firebaseuser = (await _firebaseAuth
        .createUserWithEmailAndPassword(
        email: emailTextEditingController.text,
        password: passwordTextEditingController.text)
        .catchError((errMsg) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Request Failed", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
        ),
      );
    }))
        .user;

    if (firebaseuser != null) //user created
        {
      TextInput.finishAutofillContext();

      var upload = await FirebaseStorage.instance
          .ref()
          .child("ProfilePictures")
          .child(firebaseuser.uid)
          .putFile(image!);
      var downloadUrl = await upload.ref.getDownloadURL();

      var uploadPhotoId = await FirebaseStorage.instance
          .ref()
          .child("PhotoId")
          .child(firebaseuser.uid)
          .putFile(photoId!);
      var photoIdUrl = await uploadPhotoId.ref.getDownloadURL();

            var profile = ProfileModel(
              id: firebaseuser.uid,
              email: emailTextEditingController.text,
              name: firstnameTextEditingController.text,
              photoID: photoIdUrl,
              image: downloadUrl,
              bloodGroup: bloodGroup+bloodGroupFactor,
              profession: professionTextEditingController.text,
              workplace: workplaceTextEditingController.text,
              dob: dobTextEditingController.text,
              presentAddress: presentAddressTextEditingController.text,
              permanentAddress: permanentAddressTextEditingController.text,
              phone: countryCode+phoneTextEditingController.text,
              status: "Pending",
              statusDetails: "Membership fee not paid yet.",
              validity: "invalid",
              verified: "false",
              designation: "Member",
              memberId: "${phoneTextEditingController.text.substring(1, 10)}",
              emergencyContactPerson: emergencyContactPerson.text,
              emergencyContactRelation: emergencyContactRelation.text,
              emergencyContactPhone: emergencyContactPhone.text,
              role: "user",
              signedUp: "${DateTime.now().millisecondsSinceEpoch}",
            )..save();
            ProfileController.to.profile(profile);
            fcmSubscribe(firebaseuser.uid.toString(), "${bloodGroup+bloodGroupFactor}");

            Get.offAllNamed(AppRoutes.MAINSCREEN);

    } else {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            "Request Failed", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
        ),
      );
    }
  }

  fcmSubscribe(String userUID, String bloodGroup) async {
    FirebaseMessaging.instance.subscribeToTopic("all");
    FirebaseMessaging.instance.subscribeToTopic(userUID);
    FirebaseMessaging.instance.subscribeToTopic(bloodGroup);
  }


  DateFormat dateFormat = DateFormat("MMMM d, yyyy");
  DateTime _logSubmitDate = DateTime.now().subtract(Duration(days: 0));
  void _selectDOB(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: _logSubmitDate,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != _logSubmitDate)
      setState(() {
        _logSubmitDate = picked;
        dobTextEditingController.text = dateFormat.format(_logSubmitDate);
      });
  }
}
