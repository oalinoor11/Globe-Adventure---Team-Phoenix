import 'dart:io';

import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class ScholarshipApplyScreen extends StatefulWidget {
  @override
  State<ScholarshipApplyScreen> createState() => _ScholarshipApplyScreenState();
}

class _ScholarshipApplyScreenState extends State<ScholarshipApplyScreen> {
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  GlobalKey<FormState> _form = GlobalKey();

  ScreenshotController screenshotController = ScreenshotController();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _fatherNameController = TextEditingController();
  TextEditingController _motherNameController = TextEditingController();
  TextEditingController _presentAddressController = TextEditingController();
  TextEditingController _studentsPhoneController = TextEditingController();
  TextEditingController _parentsPhoneController = TextEditingController();
  TextEditingController _emailAddressController = TextEditingController();
  TextEditingController _sscResultController = TextEditingController();
  TextEditingController _hscResultController = TextEditingController();
  TextEditingController _referralCodeController = TextEditingController();
  File? _studentsPhoto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Apply for Processing",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: _form,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
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
                TextFormField(
                  controller: _fatherNameController,
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
                TextFormField(
                  controller: _motherNameController,
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
                TextFormField(
                  controller: _presentAddressController,
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
                TextFormField(
                  controller: _studentsPhoneController,
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
                TextFormField(
                  controller: _parentsPhoneController,
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
                TextFormField(
                  controller: _emailAddressController,
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
                TextFormField(
                  controller: _sscResultController,
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
                TextFormField(
                  controller: _hscResultController,
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
                TextFormField(
                  controller: _referralCodeController,
                  keyboardType: TextInputType.number,
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
                InkWell(
                  onTap: () async {
                    print("camera button clicked");
                    var pickedFile = await ImagePicker()
                        .pickImage(source: ImageSource.gallery);
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
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Text("Student's Photo",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16)),
                        SizedBox(width: 10),
                        Icon(
                          Icons.add_a_photo,
                          size: 20,
                          color: Colors.black,
                        ),
                      ],
                    ),
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
                SizedBox(height: 10),
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
      ),
    );
  }
}
