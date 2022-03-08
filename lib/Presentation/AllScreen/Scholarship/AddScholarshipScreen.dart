import 'package:BornoBangla/Data/Models/course_model.dart';
import 'package:BornoBangla/Data/Models/scholarship_model.dart';
import 'package:BornoBangla/Data/Models/university_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screenshot/screenshot.dart';

class AddScholarshipScreen extends StatefulWidget {
  @override
  State<AddScholarshipScreen> createState() => _AddScholarshipScreenState();
}

class _AddScholarshipScreenState extends State<AddScholarshipScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  TextEditingController _scholarshipNameController = TextEditingController();
  TextEditingController _videoIdController = TextEditingController();
  TextEditingController _applicationLinkController = TextEditingController();
  UniversityModel? selectedUniversity;
  String? selectedUniversityId;
  CourseModel? selectedCourse;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Add New Scholarship",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
                      ? DropdownButtonFormField<String>(
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
                        )
                      : CircularProgressIndicator();
                },
                future: UniversityModel.getAllUniversities(),
              ),
              selectedUniversity == null
                  ? Container()
                  : Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: DropdownButtonFormField<CourseModel>(
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
                    if (selectedUniversity == null) {
                      Get.snackbar(
                        "Error",
                        "Please select university",
                        icon: Icon(
                          Icons.error,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.red,
                      );
                      return;
                    }
                    if (selectedCourse == null) {
                      Get.snackbar(
                        "Error",
                        "Please select course",
                        icon: Icon(
                          Icons.error,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.red,
                      );
                      return;
                    }
                    await ScholarshipModel(
                      name: _scholarshipNameController.text,
                      applicationLink: _applicationLinkController.text,
                      videoId: _videoIdController.text,
                      university: selectedUniversity!,
                      course: selectedCourse!,
                    ).save();
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
