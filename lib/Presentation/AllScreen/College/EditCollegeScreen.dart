import 'dart:io';

import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/college_model.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class EditCollegeScreen extends StatefulWidget {
  @override
  State<EditCollegeScreen> createState() => _EditCollegeScreenState();
}

class _EditCollegeScreenState extends State<EditCollegeScreen> {
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  ScreenshotController screenshotController = ScreenshotController();
  CollegeModel collegeModel = Get.arguments;
  TextEditingController _nameController = TextEditingController();
  File? _image;
  bool loader = false;

  @override
  void initState() {
    _nameController = TextEditingController(text: collegeModel.name);
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
            "Edit College",
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
                      ? Image.network(collegeModel.image)
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
                    if (_image != null) {
                      setState(() {
                        loader = true;
                      });
                      var upload = await FirebaseStorage.instance
                          .ref()
                          .child("college")
                          .child(_nameController.text)
                          .putFile(_image!);
                      var downloadUrl = await upload.ref.getDownloadURL();
                      collegeModel.image = downloadUrl;
                    }
                    collegeModel.name = _nameController.text;
                    await collegeModel.update();
                    setState(() {
                      loader = false;
                    });
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
                      await collegeModel.delete();
                      Get.back();
                    }
                  },
                  child: Center(
                    child: Text(
                      "Delete College",
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
