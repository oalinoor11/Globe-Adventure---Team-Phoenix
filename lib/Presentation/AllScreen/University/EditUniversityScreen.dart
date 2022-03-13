import 'dart:io';

import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/university_model.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class EditUniversityScreen extends StatefulWidget {
  @override
  State<EditUniversityScreen> createState() => _EditUniversityScreenState();
}

class _EditUniversityScreenState extends State<EditUniversityScreen> {
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  ScreenshotController screenshotController = ScreenshotController();
  List ratingList = ["1", "2", "3", "4", "5"];
  String? selectedRating;
  UniversityModel universityModel = Get.arguments;

  TextEditingController _nameController = TextEditingController();

  File? _image;
  bool loader = false;

  @override
  void initState() {
    _nameController.text = universityModel.name;
    selectedRating = universityModel.rating;
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
            "Edit University",
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
                  labelText: "University Name",
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
                        selectedRating = v;
                      });
                    },
                    value: selectedRating,
                    hint: Text("University Rating",
                        style: TextStyle(color: Colors.black)),
                    items: ratingList
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
              InkWell(
                onTap: () async {
                  print("camera button clicked");
                  var pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      _image = File(pickedFile.path);
                    });
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      color: Colors.white,
                    ),
                    child: _image == null
                        ? Image.network(
                            universityModel.image,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                  ),
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
                          .child("university")
                          .child(_nameController.text)
                          .putFile(_image!);
                      var downloadUrl = await upload.ref.getDownloadURL();
                      universityModel.image = downloadUrl;
                    }
                    universityModel.name = _nameController.text;
                    universityModel.rating = selectedRating!;
                    await universityModel.update();
                    Get.back();
                    setState(() {
                      loader = false;
                    });
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
                      await universityModel.delete();
                      Get.back();
                    }
                  },
                  child: Center(
                    child: Text(
                      "Delete University",
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
