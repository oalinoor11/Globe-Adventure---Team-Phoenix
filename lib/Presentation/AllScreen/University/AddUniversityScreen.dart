import 'dart:io';

import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/university_model.dart';
import 'package:BornoBangla/Presentation/Controllers/university.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class AddUniversityScreen extends StatefulWidget {
  @override
  State<AddUniversityScreen> createState() => _AddUniversityScreenState();
}

class _AddUniversityScreenState extends State<AddUniversityScreen> {
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  ScreenshotController screenshotController = ScreenshotController();

  TextEditingController _nameController = TextEditingController();

  List ratingList = ["1", "2", "3", "4", "5"];
  String? selectedRating;

  File? _image;
  File? bannerImages;
  bool loader = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Center(
          child: Text(
            "Add New University",
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
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _image == null
                      ? Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("University Image",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12)),
                            SizedBox(height: 10),
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
              Text("(image ratio should be 1/1)", style: TextStyle(color: Colors.grey),),
              SizedBox(height: 20),
              InkWell(
                onTap: () async {
                  print("camera button clicked");
                  var pickedFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedFile != null) {
                    setState(() {
                      bannerImages = File(pickedFile.path);
                    });
                  }
                },
                child: Container(
                  height: 90,
                  width: 160,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: bannerImages == null
                      ? Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Banner Image",
                          style: TextStyle(
                              color: Colors.black, fontSize: 16)),
                      SizedBox(height: 10),
                      Icon(
                        Icons.add_a_photo,
                        size: 20,
                        color: Colors.black,
                      ),
                    ],
                  )
                      : Image.file(bannerImages!),
                ),
              ),
              Text("(image ratio should be 16/9)", style: TextStyle(color: Colors.grey),),
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
                    if (_nameController.text.isEmpty || _image == null) {
                      Get.snackbar("Failed", "Please fill all the fields",
                          snackPosition: SnackPosition.BOTTOM);
                    } else {
                      setState(() {
                        loader = true;
                      });
                      var upload = await FirebaseStorage.instance
                          .ref()
                          .child("country_flags")
                          .child(_nameController.text)
                          .putFile(_image!);
                      var downloadUrl = await upload.ref.getDownloadURL();

                      var upload2 = await FirebaseStorage.instance
                          .ref()
                          .child("banner")
                          .child(_nameController.text)
                          .putFile(bannerImages!);
                      var bannerUrls = await upload2.ref.getDownloadURL();

                      await UniversityModel(
                        country: UniversityController.to.selectedCountry(),
                        name: _nameController.text,
                        rating: selectedRating!,
                        image: downloadUrl,
                        bannerImages: bannerUrls,
                        courseList: [],
                      ).save();
                      setState(() {
                        loader = false;
                      });
                      Navigator.of(context).pop(true);
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
