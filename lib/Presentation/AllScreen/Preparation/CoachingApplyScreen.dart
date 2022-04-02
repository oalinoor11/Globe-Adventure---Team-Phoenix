import 'dart:io';

import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/branch_model.dart';
import 'package:BornoBangla/Data/Models/coaching_apply_form_model.dart';
import 'package:BornoBangla/Data/Models/coaching_course_model.dart';
import 'package:BornoBangla/Data/Models/coaching_model.dart';
import 'package:BornoBangla/Presentation/Controllers/coaching_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class CoachingApplyScreen extends StatefulWidget {
  @override
  State<CoachingApplyScreen> createState() => _CoachingApplyScreenState();
}

class _CoachingApplyScreenState extends State<CoachingApplyScreen> {
  List timeList = ["Morning", "Day", "Evening"];
  String? selectedTime;
  double amount = Get.arguments;

  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  ScreenshotController screenshotController = ScreenshotController();

  TextEditingController nameController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  TextEditingController fathersNameController = TextEditingController();
  TextEditingController mothersNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController studentsPhoneController = TextEditingController();
  TextEditingController parentsPhoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController sscController = TextEditingController();
  TextEditingController hscController = TextEditingController();
  File? image;
  File? signatureImage;

  CoachingModel? selectedCoaching;
  CoachingCourseModel? selectedProgram;
  String? selectedBranch;
  bool isLoading = false;

  @override
  void initState() {
    selectedCoaching = CoachingController.to.coachingModel();
    selectedProgram = CoachingController.to.coachingCourseModel();
    super.initState();
  }

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
                "Apply Now",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelText: "Name",
                      labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: fathersNameController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelText: "Father's Name",
                      labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: mothersNameController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelText: "Mothers's Name",
                      labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: addressController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelText: "Address",
                      labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: studentsPhoneController,
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelText: "Student's Phone",
                      labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: parentsPhoneController,
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelText: "Parent's Phone",
                      labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelText: "Email Address",
                      labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: sscController,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelText: "SSC Result",
                      labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: hscController,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelText: "HSC Result",
                      labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: StreamBuilder<List<CoachingModel>>(
                        stream: CoachingModel.getCoachingList(
                            CoachingController.to.selectedType()),
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? DropdownButtonFormField<CoachingModel>(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.green, width: 1)),
                                  ),
                                  onChanged: (v) {
                                    setState(() {
                                      selectedCoaching = v;
                                    });
                                  },
                                  value: selectedCoaching,
                                  hint: Text("Select Coaching",
                                      style: TextStyle(color: Colors.black)),
                                  items: snapshot.data!
                                      .map(
                                        (e) => DropdownMenuItem(
                                          child: Text(
                                            e.name,
                                            textAlign: TextAlign.start,
                                          ),
                                          alignment: Alignment.topLeft,
                                          value: e,
                                        ),
                                      )
                                      .toList())
                              : Container();
                        }),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: StreamBuilder<List<BranchModel>>(
                        stream: BranchModel.getAllAsStream(),
                        builder: (context, snapshot) {
                          return snapshot.hasData
                              ? DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                            color: Colors.green, width: 1)),
                                  ),
                                  onChanged: (v) {
                                    setState(() {
                                      selectedBranch = v;
                                    });
                                  },
                                  value: selectedBranch,
                                  hint: Text("Select Branch",
                                      style: TextStyle(color: Colors.black)),
                                  items: snapshot.data!
                                      .map(
                                        (e) => DropdownMenuItem<String>(
                                          child: Text(
                                            e.name,
                                            textAlign: TextAlign.start,
                                          ),
                                          alignment: Alignment.topLeft,
                                          value: e.name,
                                        ),
                                      )
                                      .toList())
                              : Container();
                        }),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: DropdownButtonFormField<CoachingCourseModel>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1)),
                        ),
                        onChanged: (v) {
                          setState(() {
                            selectedProgram = v;
                          });
                        },
                        value: selectedProgram,
                        hint: Text("Select Program",
                            style: TextStyle(color: Colors.black)),
                        items: selectedCoaching?.courses
                            .map((e) => DropdownMenuItem(
                                child: Text(
                                  e.name,
                                  textAlign: TextAlign.start,
                                ),
                                alignment: Alignment.topLeft,
                                value: e))
                            .toList()),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1)),
                        ),
                        onChanged: (v) {
                          setState(() {
                            selectedTime = v;
                          });
                        },
                        value: selectedTime,
                        hint: Text("Preferable Time",
                            style: TextStyle(color: Colors.black)),
                        items: timeList
                            .map((e) => DropdownMenuItem<String>(
                                child: Text(
                                  e,
                                  textAlign: TextAlign.start,
                                ),
                                alignment: Alignment.topLeft,
                                value: e))
                            .toList()),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      print("camera button clicked");
                      var pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          image = File(pickedFile.path);
                        });
                      }
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: image == null
                          ? Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Student's Photo",
                              style: TextStyle(color: Colors.black, fontSize: 12)),
                          SizedBox(height: 10),
                          Icon(
                            Icons.add_a_photo,
                            size: 20,
                            color: Colors.black,
                          ),
                        ],
                      )
                          : Image.file(image!),
                    ),
                  ),
                  Text("(image ratio should be 1/1)", style: TextStyle(color: Colors.grey),),
                  SizedBox(height: 20),
                  TextField(
                    controller: referralController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelText: "Referral Code (optional)",
                      labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text("Signature", style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 140,
                    width: double.infinity,
                    child: Screenshot(
                      controller: screenshotController,
                      child: SfSignaturePad(
                        key: _signaturePadKey,
                        backgroundColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () {
                          _signaturePadKey.currentState!.clear();
                        },
                        child: const Text(
                          "clear",
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "By clicking ",
                        style: TextStyle(color: Colors.black87,
                            fontSize: 11),
                      ),
                      Text(
                        "Next",
                        style: TextStyle(color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 11),
                      ),
                      Text(
                        ", you are agreeing to the",
                        style: TextStyle(color: Colors.black87,
                            fontSize: 11),
                      ),
                      TextButton(
                        onPressed: () async {
                          await launch(
                            "https://drive.google.com/file/d/1BAnNHhmwrYWABwOlSXNO3uebgwsYHxuR/view?usp=sharing",
                          );
                        },
                        child: Text(
                          "terms & conditions",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 11),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 50,
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : RaisedButton(
                            elevation: 0,
                            color: Colors.green,
                            textColor: Colors.white,
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(8.0),
                            ),
                            onPressed: () async {
                              if (image != null && nameController.text.isNotEmpty
                              && fathersNameController.text.isNotEmpty
                              && mothersNameController.text.isNotEmpty
                              && addressController.text.isNotEmpty
                              && studentsPhoneController.text.isNotEmpty
                              && parentsPhoneController.text.isNotEmpty
                              && emailController.text.isNotEmpty
                              && sscController.text.isNotEmpty
                              && hscController.text.isNotEmpty
                              && selectedBranch != null
                              && selectedTime != null) {
                                FocusManager.instance.primaryFocus?.unfocus();
                                var isPaymentComplete = await Get.toNamed(
                                    AppRoutes.PAYMENTSCREEN,
                                    arguments: amount);
                                if (isPaymentComplete == true){
                                  setState(() {
                                isLoading = true;
                              });
                              var upload = await FirebaseStorage.instance
                                  .ref()
                                  .child("student_images_coaching")
                                  .child(nameController.text)
                                  .putFile(image!);
                              var studentImageUrl =
                                  await upload.ref.getDownloadURL();
                              var tempData = await screenshotController.capture(
                                  pixelRatio: 10);
                              var signatureImageUrl;
                              if (tempData != null) {
                                final directory =
                                    await getApplicationDocumentsDirectory();
                                signatureImage =
                                    await File('${directory.path}/image.png')
                                        .create();
                                await signatureImage!.writeAsBytes(tempData);

                                upload = await FirebaseStorage.instance
                                    .ref()
                                    .child("signature_images")
                                    .child(nameController.text)
                                    .putFile(signatureImage!);
                                signatureImageUrl =
                                    await upload.ref.getDownloadURL();
                              }

                              CoachingApplyFormModel model = CoachingApplyFormModel(
                                name: nameController.text,
                                referral: referralController.text,
                                email: emailController.text,
                                studentsPhone: studentsPhoneController.text,
                                parentsPhone: parentsPhoneController.text,
                                address: addressController.text,
                                branch: selectedBranch!,
                                coachingCourse: selectedProgram!,
                                preferableTime: selectedTime!,
                                image: studentImageUrl,
                                signatureImage: signatureImageUrl,
                                coachingName: selectedCoaching!.name,
                                fathersName: fathersNameController.text,
                                mothersName: mothersNameController.text,
                                hscResult: hscController.text,
                                sscResult: sscController.text,
                              );
                              await model.save();
                              // http://msg.elitbuzz-bd.com/smsapi?api_key=C20081696225eaffaf0075.13009072&type=text&contacts=01798161323&senderid=37935&msg=Test message one
                              var result = await http.get(
                                Uri(
                                  scheme: "http",
                                  host: "msg.elitbuzz-bd.com",
                                  path: "/smsapi",
                                  queryParameters: {
                                    "api_key": "C20081696225eaffaf0075.13009072",
                                    "type": "text",
                                    "contacts": studentsPhoneController.text.trim(),
                                    "senderid": "37935",
                                    "msg": "আপনি সফলভাবে বর্ণবাংলা অ্যাপ -এ কোচিং -এ ভর্তির আবেদন করেছেন।",
                                  },
                                ),
                              );
                                  await Get.snackbar(
                                    "Application Submitted",
                                    "Your Application has been submitted",
                                    backgroundColor: Colors.green,
                                    snackPosition: SnackPosition.BOTTOM,
                                    colorText: Colors.white,
                                  );
                                  Get.offAllNamed(AppRoutes.MAINSCREEN);
                                  setState(() {
                                    isLoading = false;
                                  });
                              }
                                else {
                                  Get.snackbar(
                                    "Payment Failed",
                                    "Payment is not complete",
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    colorText: Colors.white,
                                  );
                                }
                              }
                              else {
                                Get.snackbar(
                                  "Failed!",
                                  "Fill up all field",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                                return;
                              }
                            },
                            child: Center(
                              child: Text(
                                "Next",
                                style: TextStyle(
                                  fontSize: 22.0,
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
      ),
    );
  }
}
