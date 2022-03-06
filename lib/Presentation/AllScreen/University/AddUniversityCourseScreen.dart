import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/course_model.dart';
import 'package:BornoBangla/Data/Models/university_model.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class AddUniversityCourseScreen extends StatefulWidget {
  @override
  State<AddUniversityCourseScreen> createState() =>
      _AddUniversityCourseScreenState();
}

class _AddUniversityCourseScreenState extends State<AddUniversityCourseScreen> {
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  ScreenshotController screenshotController = ScreenshotController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _durationController = TextEditingController();
  TextEditingController _admissionFeesController = TextEditingController();
  TextEditingController _tuitionFeesController = TextEditingController();

  UniversityModel _universityModel = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Add New Course",
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
              TextField(
                controller: _durationController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green, width: 1)),
                  labelText: "Course Duration",
                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _admissionFeesController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green, width: 1)),
                  labelText: "Admission Fees",
                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _tuitionFeesController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green, width: 1)),
                  labelText: "Tuition Fees",
                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 50,
                child: RaisedButton(
                  elevation: 0,
                  color: Colors.green,
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  onPressed: () {
                    CourseModel courseModel = CourseModel(
                      admissionFees: int.parse(_admissionFeesController.text),
                      tuitionFees: int.parse(_tuitionFeesController.text),
                      name: _nameController.text,
                      duration: _durationController.text,
                    );
                    _universityModel.courseList.add(courseModel);
                    _universityModel.update();
                    Get.back();
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
            ],
          ),
        ),
      ),
    );
  }
}
