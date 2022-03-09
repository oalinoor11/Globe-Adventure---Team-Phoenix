import 'dart:io';
import 'package:BornoBangla/Presentation/Controllers/coaching_controller.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../../Data/Models/coaching_course_model.dart';
import '../../../Data/Models/coaching_model.dart';

class EditCoachingCourseScreen extends StatefulWidget {
  @override
  State<EditCoachingCourseScreen> createState() =>
      _EditCoachingCourseScreenState();
}

class _EditCoachingCourseScreenState extends State<EditCoachingCourseScreen> {
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  ScreenshotController screenshotController = ScreenshotController();

  CoachingCourseModel _coachingCourseModel = Get.arguments;

  TextEditingController _nameController = TextEditingController();

  TextEditingController _regularCourseFee = TextEditingController();

  TextEditingController _discountedCourseFee = TextEditingController();

  File? image;
  bool loader = false;
  CoachingCourseModel coachingCourseModel = Get.arguments;

  @override
  void initState() {
    _nameController = TextEditingController(text: _coachingCourseModel.name);
    _regularCourseFee = TextEditingController(
        text: _coachingCourseModel.regularCourseFee.toString());
    _discountedCourseFee = TextEditingController(
        text: _coachingCourseModel.discountedCourseFee.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Edit Course",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green, width: 1)),
                  labelText: "Course Name",
                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
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
                      image = File(pickedFile.path);
                    });
                  }
                },
                child: Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: image == null
                      ? Image.network(coachingCourseModel.image)
                      : Image.file(image!),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _regularCourseFee,
                keyboardType: TextInputType.number,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green, width: 1)),
                  labelText: "Course Fee (regular)",
                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _discountedCourseFee,
                keyboardType: TextInputType.number,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green, width: 1)),
                  labelText: "Course Fee (after discount)",
                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                child: loader
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
                          setState(() {
                            loader = true;
                          });
                          if (image != null) {
                            var upload = await FirebaseStorage.instance
                                .ref()
                                .child("coaching")
                                .child(_nameController.text)
                                .putFile(image!);
                            var downloadUrl = await upload.ref.getDownloadURL();
                            _coachingCourseModel.image = downloadUrl;
                          }
                          _coachingCourseModel.discountedCourseFee =
                              int.parse(_discountedCourseFee.text);
                          _coachingCourseModel.regularCourseFee =
                              int.parse(_regularCourseFee.text);
                          _coachingCourseModel.name = _nameController.text;
                          Get.back(result: _coachingCourseModel);
                          setState(() {
                            loader = false;
                          });
                        },
                        child: Center(
                          child: Text(
                            "Save Changes",
                            style: TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                child: RaisedButton(
                  elevation: 0,
                  color: Colors.red,
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  onPressed: () async {
                    setState(() {
                      loader = true;
                    });
                    var result = await CoolAlert.show(
                      backgroundColor: Colors.green,
                      confirmBtnColor: Colors.red,
                      confirmBtnText: ("Delete"),
                      width: 10,
                      context: context,
                      type: CoolAlertType.confirm,
                      onCancelBtnTap: () => Get.back(result: false),
                      onConfirmBtnTap: () => Get.back(result: true),
                    );
                    if (result) {
                      Get.back(result: true);
                    }
                  },
                  child: Center(
                    child: Text(
                      "Delete Course",
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
    );
  }
}
