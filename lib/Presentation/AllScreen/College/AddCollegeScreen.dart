import 'dart:io';

import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/college_model.dart';
import 'package:BornoBangla/Data/firebase_collections.dart';
import 'package:BornoBangla/Presentation/Controllers/college_controller.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class AddCollegeScreen extends StatefulWidget {
  @override
  State<AddCollegeScreen> createState() => _AddCollegeScreenState();
}

class _AddCollegeScreenState extends State<AddCollegeScreen> {
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  ScreenshotController screenshotController = ScreenshotController();
  TextEditingController _nameController = TextEditingController();

  File? _image;
  bool loader = false;

  @override
  void initState() {
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
            "Add New College",
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
                  labelText: "College Name",
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
                      _image = File(pickedFile.path);
                    });
                    print("image selected");
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
                  child: _image == null
                      ? Row(
                          children: [
                            SizedBox(width: 10),
                            Text("College Image",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16)),
                            SizedBox(width: 10),
                            Icon(
                              Icons.add_a_photo,
                              size: 20,
                              color: Colors.black,
                            ),
                          ],
                        )
                      : Image.file(_image!),
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
                    if (_image == null && _nameController.text.isNotEmpty) {
                      print("image is null");
                      Get.snackbar(
                        "Error",
                        "Please select a college image",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        borderRadius: 8,
                        snackStyle: SnackStyle.FLOATING,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        animationDuration: Duration(milliseconds: 500),
                      );
                    } else if (_image == null && _nameController.text.isEmpty) {
                      print("image is null");
                      Get.snackbar(
                        "Error",
                        "Please select a college image",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        borderRadius: 8,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        animationDuration: Duration(milliseconds: 500),
                      );
                    } else if (_image != null && _nameController.text.isEmpty) {
                      print("image is not null");
                      Get.snackbar(
                        "Error",
                        "Please enter a college name",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.red,
                        borderRadius: 8,
                        snackStyle: SnackStyle.FLOATING,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        animationDuration: Duration(milliseconds: 500),
                      );
                    } else if (_image != null &&
                        _nameController.text.isNotEmpty) {
                      setState(() {
                        loader = true;
                      });
                      var upload = await FirebaseStorage.instance
                          .ref()
                          .child("college")
                          .child(_nameController.text)
                          .putFile(_image!);
                      var downloadUrl = await upload.ref.getDownloadURL();

                      await CollegeModel(
                        name: _nameController.text,
                        image: downloadUrl,
                        country: CollegeController.to.selectedCountry(),
                      ).save();
                      setState(() {
                        loader = false;
                      });
                      Get.back();
                    }
                      Get.snackbar(
                        "Success",
                        "College added successfully",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        borderRadius: 8,
                        snackStyle: SnackStyle.FLOATING,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        animationDuration: Duration(milliseconds: 500),
                      );
                  },
                  child: Center(
                    child: Text(
                      "Save",
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
