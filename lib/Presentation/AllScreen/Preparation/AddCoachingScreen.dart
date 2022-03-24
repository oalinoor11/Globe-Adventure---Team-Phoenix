import 'dart:io';

import 'package:BornoBangla/Data/Models/coaching_model.dart';
import 'package:BornoBangla/Presentation/Controllers/coaching_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:image_picker/image_picker.dart';

class AddCoachingScreen extends StatefulWidget {
  @override
  State<AddCoachingScreen> createState() => _AddCoachingScreenState();
}

class _AddCoachingScreenState extends State<AddCoachingScreen> {
  TextEditingController nameController = TextEditingController();
  File? image;
  File? bannerImages;
  List ratingList = ["1", "2", "3", "4", "5"];
  String? selectedRating;
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
            "Add New Coaching",
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
                keyboardType: TextInputType.text,
                cursorColor: Colors.green,
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.green, width: 1)),
                  labelText: "Coaching Name",
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
                    hint: Text("Coaching Rating",
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
                      image = File(pickedFile.path);
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
                  child: image == null
                      ? Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Logo",
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
                      : Image.file(image!),
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
              loader
                ? Center(
                child: CircularProgressIndicator(),
                   )
              : InkWell(
                child: Container(
                  height: 40.0,
                  width: 80.0,
                  decoration: new BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text("SAVE",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold))),
                ),
                onTap: () async {
                  if (image != null) {
                    setState(() {
                      loader = true;
                    });
                    var upload = await FirebaseStorage.instance
                        .ref()
                        .child("image")
                        .child(nameController.text)
                        .putFile(image!);
                    var downloadUrl = await upload.ref.getDownloadURL();

                    var upload2 = await FirebaseStorage.instance
                        .ref()
                        .child("banner")
                        .child(nameController.text)
                        .putFile(bannerImages!);
                    var bannerUrls = await upload2.ref.getDownloadURL();
                    await CoachingModel(
                      name: nameController.text,
                      image: downloadUrl,
                      rating: selectedRating!,
                      bannerImages: bannerUrls,
                      courses: [],
                      type: CoachingController.to.selectedType(),
                    ).save();
                    Navigator.of(context).pop(true);
                    setState(() {
                      loader = false;
                    });
                    Get.snackbar(
                      "Done",
                      "Coaching Added",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  } else {
                    Get.snackbar(
                      "Failed!",
                      "Add valid Name and Logo",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
