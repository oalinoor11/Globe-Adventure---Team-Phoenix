import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/course_model.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class EditCourseScreen extends StatefulWidget {
  @override
  State<EditCourseScreen> createState() => _EditCourseScreenState();
}

class _EditCourseScreenState extends State<EditCourseScreen> {
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  ScreenshotController screenshotController = ScreenshotController();

  CourseModel _courseModel = Get.arguments;

  TextEditingController _nameController = TextEditingController();

  TextEditingController _durationController = TextEditingController();

  TextEditingController _levelController = TextEditingController();

  TextEditingController _requirementsController = TextEditingController();

  TextEditingController _scholarshipController = TextEditingController();

  TextEditingController _admissionFeesController = TextEditingController();

  TextEditingController _tuitionFeesController = TextEditingController();

  @override
  void initState() {
    _nameController = TextEditingController(text: _courseModel.name);
    _durationController = TextEditingController(text: _courseModel.duration);
    _admissionFeesController =
        TextEditingController(text: _courseModel.admissionFees.toString());
    _tuitionFeesController =
        TextEditingController(text: _courseModel.tuitionFees.toString());
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
                controller: _levelController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green, width: 1)),
                  labelText: "Level",
                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _requirementsController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green, width: 1)),
                  labelText: "Requirements",
                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _scholarshipController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green, width: 1)),
                  labelText: "Scholarship",
                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _admissionFeesController,
                keyboardType: TextInputType.number,
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
                keyboardType: TextInputType.number,
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
                  onPressed: () async {
                    _courseModel.admissionFees =
                        int.parse(_admissionFeesController.text);
                    _courseModel.tuitionFees =
                        int.parse(_tuitionFeesController.text);
                    _courseModel.name = _nameController.text;
                    _courseModel.duration = _durationController.text;
                    Get.back(result: _courseModel);
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
