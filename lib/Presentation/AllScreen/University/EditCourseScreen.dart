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

  List levelList = [
    "Diploma",
    "Undergraduate",
    "Postgraduate",
    "PhD",
    "Certificate"
  ];
  String? selectedLevel;

  List currencyList = ["\$", "৳", "₹"];
  String? selectedCurrency;

  List durationList = [
    "1 Month",
    "2 Months",
    "3 Months",
    "4 Months",
    "5 Months",
    "6 Months",
    "7 Months",
    "8 Months",
    "9 Months",
    "10 Months",
    "11 Months",
    "1 Year",
    "1.5 Years",
    "2 Years",
    "2.5 Years",
    "3.5 Years",
    "4.5 Years",
    "5.5 Years",
    "6 Years"
  ];
  String? selectedDuration;

  CourseModel _courseModel = Get.arguments;

  TextEditingController _nameController = TextEditingController();

  TextEditingController _requirementsController = TextEditingController();

  TextEditingController _scholarshipController = TextEditingController();

  TextEditingController _admissionFeesController = TextEditingController();

  TextEditingController _tuitionFeesController = TextEditingController();

  @override
  void initState() {
    _nameController = TextEditingController(text: _courseModel.name);
    _requirementsController =
        TextEditingController(text: _courseModel.requirements);
    _scholarshipController =
        TextEditingController(text: _courseModel.scholarship);
    _admissionFeesController =
        TextEditingController(text: _courseModel.admissionFees.toString());
    _tuitionFeesController =
        TextEditingController(text: _courseModel.tuitionFees.toString());
    selectedLevel = _courseModel.level;
    selectedDuration = _courseModel.duration;
    selectedCurrency = _courseModel.currency;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Center(
          child: Text(
            "Edit Course",
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
                        selectedDuration = v;
                      });
                    },
                    value: selectedDuration,
                    hint: Text("Course Duration", style: TextStyle(color: Colors.black)),
                    items: durationList
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
                        selectedLevel = v;
                      });
                    },
                    value: selectedLevel,
                    hint: Text("Level", style: TextStyle(color: Colors.black)),
                    items: levelList
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
                        selectedCurrency = v;
                      });
                    },
                    value: selectedCurrency,
                    hint: Text("Select Currency",
                        style: TextStyle(color: Colors.black)),
                    items: currencyList
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
                    _courseModel.level = selectedLevel!;
                    _courseModel.requirements = _requirementsController.text;
                    _courseModel.scholarship = _scholarshipController.text;
                    _courseModel.currency = selectedCurrency!;
                    _courseModel.duration = selectedDuration!;
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
