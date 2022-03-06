import 'dart:io';

import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/firebase_collections.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class AddCountryScreen extends StatefulWidget {
  @override
  State<AddCountryScreen> createState() => _AddCountryScreenState();
}

class _AddCountryScreenState extends State<AddCountryScreen> {
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  ScreenshotController screenshotController = ScreenshotController();
  TextEditingController _nameController = TextEditingController();

  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Add New Country",
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
                  labelText: "Country Name",
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
                    Get.snackbar(
                      "Image Selected",
                      "Image Selected",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      borderRadius: 8,
                      margin: EdgeInsets.all(8),
                      snackStyle: SnackStyle.FLOATING,
                      duration: Duration(seconds: 2),
                      icon: Icon(Icons.check, color: Colors.white),
                    );
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
                            Text("Country FLag",
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
                child: RaisedButton(
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
                        "Please select a Country image",
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
                        "Please select a Country image",
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
                        "Please enter a Country name",
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
                      var upload = await FirebaseStorage.instance
                          .ref()
                          .child("country_flags")
                          .child(_nameController.text)
                          .putFile(_image!);
                      var downloadUrl = await upload.ref.getDownloadURL();
                      FirebaseCollections.COUNTRYCOLLECTION.add({
                        "countryName": _nameController.text,
                        "countryFlag": downloadUrl,
                      });
                      Get.snackbar(
                        "Success",
                        "Country added successfully",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        borderRadius: 8,
                        snackStyle: SnackStyle.FLOATING,
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        animationDuration: Duration(milliseconds: 500),
                      );
                    }
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
