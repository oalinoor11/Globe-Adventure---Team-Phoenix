import 'package:BornoBangla/Data/Models/course_model.dart';
import 'package:BornoBangla/Data/Models/scholarship_model.dart';
import 'package:BornoBangla/Data/Models/university_model.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:screenshot/screenshot.dart';

class EditScholarshipScreen extends StatefulWidget {
  @override
  State<EditScholarshipScreen> createState() => _EditScholarshipScreenState();
}

class _EditScholarshipScreenState extends State<EditScholarshipScreen> {
  ScreenshotController screenshotController = ScreenshotController();

  TextEditingController _scholarshipNameController = TextEditingController();

  TextEditingController _videoIdController = TextEditingController();

  TextEditingController _applicationLinkController = TextEditingController();
  ScholarshipModel _scholarshipModel = Get.arguments;
  UniversityModel? selectedUniversity;
  String? selectedUniversityId;
  CourseModel? selectedCourse;

  @override
  void initState() {
    _scholarshipNameController.text = _scholarshipModel.name;
    _videoIdController.text = _scholarshipModel.videoId;
    _applicationLinkController.text = _scholarshipModel.applicationLink;
    selectedUniversity = _scholarshipModel.university;
    selectedCourse = _scholarshipModel.course;
    selectedUniversityId = _scholarshipModel.university.id;
    selectedCourse = _scholarshipModel.course;
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
          "Edit Scholarship",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              TextField(
                controller: _scholarshipNameController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green, width: 1)),
                  labelText: "Scholarship Name",
                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _videoIdController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green, width: 1)),
                  labelText: "YouTube Video ID",
                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _applicationLinkController,
                keyboardType: TextInputType.text,
                cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green, width: 1)),
                  labelText: "Application Link",
                  labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              FutureBuilder<List<UniversityModel>>(
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                            BorderSide(color: Colors.green, width: 1)),
                    ),
                            items: snapshot.data!
                                .map((e) => DropdownMenuItem(
                                      child: Text(e.name),
                                      value: e.id,
                                    ))
                                .toList(),
                            value: selectedUniversity?.id,
                            onChanged: (value) {
                              setState(() {
                                selectedUniversityId = value;
                                selectedUniversity = snapshot.data!
                                    .firstWhere((e) => e.id == value);
                              });
                            },
                            hint: Text("Select University"),
                          ),
                      )
                      : CircularProgressIndicator();
                },
                future: UniversityModel.getAllUniversities(),
              ),
              selectedUniversity == null
                  ? Container()
                  : DropdownButtonFormField<CourseModel>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Colors.green, width: 1)),
                ),
                      items: selectedUniversity!.courseList
                          .map((e) => DropdownMenuItem(
                                child: Text(e.name),
                                value: e,
                              ))
                          .toList(),
                      value: selectedCourse,
                      onChanged: (value) {
                        setState(() {
                          selectedCourse = value;
                        });
                      },
                      hint: Text("Select Course"),
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
                    _scholarshipModel.name = _scholarshipNameController.text;
                    _scholarshipModel.videoId = _videoIdController.text;
                    _scholarshipModel.applicationLink =
                        _applicationLinkController.text;
                    _scholarshipModel.university = selectedUniversity!;
                    _scholarshipModel.course = selectedCourse!;
                    await _scholarshipModel.update();
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
                      await _scholarshipModel.delete();
                      Get.back();
                    }
                  },
                  child: Center(
                    child: Text(
                      "Delete Scholarship",
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
