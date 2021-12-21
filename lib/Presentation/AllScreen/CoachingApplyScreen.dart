import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class CoachingApplyScreen extends StatelessWidget {

  List programList = ["A Unit", "B Unit", "C Unit", "D Unit", "A+D Unit", "B+D Unit", "C+D Unit", "Medical", "Dental"];
  List timeList = ["Morning", "Day", "Evening"];
  List coachingList = ["UCC", "Retina"];
  List branchList = ["Dhaka", "Rajshahi", "Sylhet"];
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Apply Now",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.text, cursorColor: Colors.green,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide:
                        BorderSide(color: Colors.green, width: 1)),
                  labelText: "Name",
                  labelStyle: TextStyle(
                    fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text, cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Colors.green, width: 1)),
                  labelText: "Father's Name",
                  labelStyle: TextStyle(
                      fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text, cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Colors.green, width: 1)),
                  labelText: "Mothers's Name",
                  labelStyle: TextStyle(
                      fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.text, cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Colors.green, width: 1)),
                  labelText: "Address",
                  labelStyle: TextStyle(
                      fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone, cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Colors.green, width: 1)),
                  labelText: "Student's Phone",
                  labelStyle: TextStyle(
                      fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.phone, cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Colors.green, width: 1)),
                  labelText: "Parent's Phone",
                  labelStyle: TextStyle(
                      fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.emailAddress, cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Colors.green, width: 1)),
                  labelText: "Email Address",
                  labelStyle: TextStyle(
                      fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number, cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Colors.green, width: 1)),
                  labelText: "SSC Result",
                  labelStyle: TextStyle(
                      fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number, cursorColor: Colors.green,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Colors.green, width: 1)),
                  labelText: "HSC Result",
                  labelStyle: TextStyle(
                      fontSize: 16.0, color: Colors.black),
                ),
                style: TextStyle(
                  fontSize: 14.0,
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                      BorderSide(color: Colors.green, width: 1)),
                ),
                    onChanged: (v) {
                    },
                    hint: Text("Select Coaching", style: TextStyle(color: Colors.black)),
                    items: coachingList
                        .map((e) => DropdownMenuItem(
                        child: Text(e, textAlign: TextAlign.start,), alignment: Alignment.topLeft,
                        value: e
                    ))
                        .toList()),
              ),
              SizedBox(height: 20),
              SizedBox(
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          BorderSide(color: Colors.green, width: 1)),
                    ),
                    onChanged: (v) {
                    },
                    hint: Text("Select Branch", style: TextStyle(color: Colors.black)),
                    items: branchList
                        .map((e) => DropdownMenuItem(
                        child: Text(e, textAlign: TextAlign.start,), alignment: Alignment.topLeft,
                        value: e
                    ))
                        .toList()),
              ),
              SizedBox(height: 20),
              SizedBox(
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          BorderSide(color: Colors.green, width: 1)),
                    ),
                    onChanged: (v) {
                    },
                    hint: Text("Program Area", style: TextStyle(color: Colors.black)),
                    items: programList
                        .map((e) => DropdownMenuItem(
                        child: Text(e, textAlign: TextAlign.start,), alignment: Alignment.topLeft,
                        value: e
                    ))
                        .toList()),
              ),
              SizedBox(height: 20),
              SizedBox(
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                          BorderSide(color: Colors.green, width: 1)),
                    ),
                    onChanged: (v) {
                    },
                    hint: Text("Preferable Time", style: TextStyle(color: Colors.black)),
                    items: timeList
                        .map((e) => DropdownMenuItem(
                        child: Text(e, textAlign: TextAlign.start,), alignment: Alignment.topLeft,
                        value: e
                    ))
                        .toList()),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  print("camera button clicked");
                  var pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.camera);
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
                    child:Row(
                      children: [
                        SizedBox(width: 10),
                        Text("Student's Photo", style: TextStyle(color: Colors.black, fontSize: 16)),
                        SizedBox(width: 10),
                        Icon(Icons.add_a_photo, size: 20,color: Colors.black,),
                      ],
                    ),
                  ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
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
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 10,),
                  TextButton(
                    onPressed: (){
                      _signaturePadKey.currentState!.clear();
                    },
                    child: const Text(
                      "clear",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(height: 50,
                child: RaisedButton(
                  elevation: 0,
                  color: Colors.green,
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  onPressed: () {
                        Get.toNamed(AppRoutes.BKASHSCREEN);
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
    );
  }
}
