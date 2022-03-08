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
              StreamBuilder<List<UniversityModel>>(
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? DropdownButton<UniversityModel>(
                          items: snapshot.data!
                              .map((e) => DropdownMenuItem(
                                    child: Text(e.name),
                                    value: e,
                                  ))
                              .toList(),
                          value: selectedUniversity,
                          onChanged: (value) {
                            setState(() {
                              selectedUniversity = value;
                            });
                          },
                        )
                      : CircularProgressIndicator();
                },
                stream: UniversityModel.getAllUniversities(),
              ),
              selectedUniversity == null
                  ? Container()
                  : DropdownButton<CourseModel>(
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
                    await ScholarshipModel(
                            name: _scholarshipNameController.text,
                            applicationLink: _applicationLinkController.text,
                            videoId: _videoIdController.text)
                        .save();
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
