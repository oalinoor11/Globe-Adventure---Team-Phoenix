import 'dart:io';

import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/branch_model.dart';
import 'package:BornoBangla/Data/Models/coaching_apply_form_model.dart';
import 'package:BornoBangla/Data/Models/coaching_course_model.dart';
import 'package:BornoBangla/Data/Models/coaching_model.dart';
import 'package:BornoBangla/Presentation/Controllers/coaching_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../../Controllers/profile_controller.dart';

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

  TextEditingController _nameController =
  TextEditingController(text: ProfileController.to.profile()!.name);
  TextEditingController _fatherNameController =
  TextEditingController(text: ProfileController.to.profile()!.fatherName);
  TextEditingController _motherNameController =
  TextEditingController(text: ProfileController.to.profile()!.motherName);
  TextEditingController _presentAddressController =
  TextEditingController(text: ProfileController.to.profile()!.address);
  TextEditingController _studentsPhoneController =
  TextEditingController(text: ProfileController.to.profile()!.phone);
  TextEditingController _parentsPhoneController =
  TextEditingController(text: ProfileController.to.profile()!.parentPhone);
  TextEditingController _emailAddressController =
  TextEditingController(text: ProfileController.to.profile()!.email);
  TextEditingController _sscResultController = TextEditingController(
      text: ProfileController.to.profile()!.sscResult?.toString());
  TextEditingController _hscResultController = TextEditingController(
      text: ProfileController.to.profile()!.hscResult?.toString());
  TextEditingController _referralController = TextEditingController();
  File? _signaturePhoto;
  File? _studentsPhoto;

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
                  TextFormField(
                    controller: _nameController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          BorderSide(color: Colors.green, width: 1)),
                      labelText: "Name",
                      labelStyle:
                      TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _fatherNameController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          BorderSide(color: Colors.green, width: 1)),
                      labelText: "Father's Name",
                      labelStyle:
                      TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _motherNameController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          BorderSide(color: Colors.green, width: 1)),
                      labelText: "Mother's Name",
                      labelStyle:
                      TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _presentAddressController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          BorderSide(color: Colors.green, width: 1)),
                      labelText: "Address",
                      labelStyle:
                      TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _studentsPhoneController,
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          BorderSide(color: Colors.green, width: 1)),
                      labelText: "Student's Phone",
                      labelStyle:
                      TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _parentsPhoneController,
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          BorderSide(color: Colors.green, width: 1)),
                      labelText: "Parent's Phone",
                      labelStyle:
                      TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _emailAddressController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          BorderSide(color: Colors.green, width: 1)),
                      labelText: "Email Address",
                      labelStyle:
                      TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _sscResultController,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          BorderSide(color: Colors.green, width: 1)),
                      labelText: "SSC Result",
                      labelStyle:
                      TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _hscResultController,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          BorderSide(color: Colors.green, width: 1)),
                      labelText: "HSC Result",
                      labelStyle:
                      TextStyle(fontSize: 16.0, color: Colors.black),
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
                              isExpanded: true,
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
                                            maxLines: 1,
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
                  // SizedBox(height: 20),
                  // SizedBox(
                  //   child: StreamBuilder<List<BranchModel>>(
                  //       stream: BranchModel.getAllAsStream(),
                  //       builder: (context, snapshot) {
                  //         return snapshot.hasData
                  //             ? DropdownButtonFormField<String>(
                  //                 decoration: InputDecoration(
                  //                   border: OutlineInputBorder(
                  //                       borderRadius: BorderRadius.circular(8),
                  //                       borderSide: BorderSide(
                  //                           color: Colors.green, width: 1)),
                  //                 ),
                  //                 onChanged: (v) {
                  //                   setState(() {
                  //                     selectedBranch = v;
                  //                   });
                  //                 },
                  //                 value: selectedBranch,
                  //                 hint: Text("Select Branch",
                  //                     style: TextStyle(color: Colors.black)),
                  //                 items: snapshot.data!
                  //                     .map(
                  //                       (e) => DropdownMenuItem<String>(
                  //                         child: Text(
                  //                           e.name,
                  //                           textAlign: TextAlign.start,
                  //                         ),
                  //                         alignment: Alignment.topLeft,
                  //                         value: e.name,
                  //                       ),
                  //                     )
                  //                     .toList())
                  //             : Container();
                  //       }),
                  // ),
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
                  TextFormField(
                    controller: _referralController,
                    keyboardType: TextInputType.name,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          BorderSide(color: Colors.green, width: 1)),
                      labelText: "Referral Code (optional)",
                      labelStyle:
                      TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () async {
                      print("camera button clicked");
                      var pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          _studentsPhoto = File(pickedFile.path);
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
                      child: _studentsPhoto == null
                          ? ProfileController.to.profile()!.profilePicture !=
                          null
                          ? Image.network(ProfileController.to
                          .profile()!
                          .profilePicture!)
                          : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Student's Photo",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12)),
                          SizedBox(height: 10),
                          Icon(
                            Icons.add_a_photo,
                            size: 20,
                            color: Colors.black,
                          ),
                        ],
                      )
                          : kIsWeb
                          ? Image.network(_studentsPhoto!.path)
                          : Image.file(_studentsPhoto!),
                    ),
                  ),
                  Text(
                    "(image ratio should be 1/1)",
                    style: TextStyle(color: Colors.grey),
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
                    child: ProfileController.to.profile()!.signatureImage !=
                        null
                        ? Image.network(
                        ProfileController.to.profile()!.signatureImage!)
                        : Screenshot(
                      controller: screenshotController,
                      child: SfSignaturePad(
                        key: _signaturePadKey,
                        backgroundColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: ProfileController.to.profile()!.signatureImage ==
                        null,
                    child: InkWell(
                      onTap: () async {
                        _signaturePadKey.currentState?.clear();
                      },
                      child: Text("clear",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "By clicking ",
                        style: TextStyle(color: Colors.black87, fontSize: 11),
                      ),
                      Text(
                        "Next",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 11),
                      ),
                      Text(
                        ", you are agreeing to the",
                        style: TextStyle(color: Colors.black87, fontSize: 11),
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
                              if (_studentsPhoto != null && _nameController.text.isNotEmpty
                              && _fatherNameController.text.isNotEmpty &&
                                  _motherNameController.text.isNotEmpty &&
                                  _presentAddressController.text.isNotEmpty &&
                                  _studentsPhoneController.text.isNotEmpty &&
                                  _parentsPhoneController.text.isNotEmpty &&
                                  _emailAddressController.text.isNotEmpty &&
                                  _sscResultController.text.isNotEmpty &&
                                  _hscResultController.text.isNotEmpty
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
                                  .child(_nameController.text)
                                  .putFile(_studentsPhoto!);
                              var studentImageUrl =
                                  await upload.ref.getDownloadURL();
                                  var tempData = await screenshotController
                                      .capture(pixelRatio: 10);
                                  var signatureImageUrl;
                                  if (tempData != null) {
                                    final directory =
                                    await getApplicationDocumentsDirectory();
                                    _signaturePhoto = await File(
                                        '${directory.path}/image.png')
                                        .create();
                                    await _signaturePhoto!
                                        .writeAsBytes(tempData);

                                    upload = await FirebaseStorage.instance
                                        .ref()
                                        .child("student_images")
                                        .child(_nameController.text)
                                        .putFile(_signaturePhoto!);
                                    signatureImageUrl =
                                    await upload.ref.getDownloadURL();
                                  }

                              CoachingApplyFormModel model = CoachingApplyFormModel(
                                name: _nameController.text,
                                referral: _referralController.text,
                                email: _emailAddressController.text,
                                studentsPhone: _studentsPhoneController.text,
                                parentsPhone: _parentsPhoneController.text,
                                address: _presentAddressController.text,
                                branch: "selectedBranch!",
                                coachingCourse: selectedProgram!,
                                preferableTime: selectedTime!,
                                image: studentImageUrl,
                                signatureImage: signatureImageUrl,
                                coachingName: selectedCoaching!.name,
                                fathersName: _fatherNameController.text,
                                mothersName: _motherNameController.text,
                                hscResult: _hscResultController.text,
                                sscResult: _sscResultController.text,
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
                                    "contacts": _studentsPhoneController.text.trim(),
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
