import 'dart:io';

import 'package:BornoBangla/Data/Models/coaching_model.dart';
import 'package:BornoBangla/Presentation/Controllers/coaching_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
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
  List<File> bannerImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Add New Coaching",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
                  child: image == null
                      ? Row(
                          children: [
                            SizedBox(width: 10),
                            Text("Coaching Logo",
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
                      : Image.file(image!),
                ),
              ),
              SizedBox(height: 20),
              GridView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      var pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          bannerImages.add(File(pickedFile.path));
                        });
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
                      child: bannerImages.length > index
                          ? Image.file(bannerImages[index])
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(width: 10),
                                Text("Banner Image",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16)),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.add_a_photo,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                    ),
                  );
                },
                itemCount: bannerImages.length + 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
              ),
              SizedBox(height: 20),
              InkWell(
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
                    var upload = await FirebaseStorage.instance
                        .ref()
                        .child("coaching")
                        .child(nameController.text)
                        .putFile(image!);
                    var downloadUrl = await upload.ref.getDownloadURL();
                    var bannerUrls = <String>[];
                    bannerUrls =
                        await Future.wait(await bannerImages.map((e) async {
                      var upload = await FirebaseStorage.instance
                          .ref()
                          .child("coaching")
                          .child(nameController.text)
                          .putFile(image!);
                      var downloadUrl = await upload.ref.getDownloadURL();
                      return downloadUrl;
                    }).toList());
                    await CoachingModel(
                      name: nameController.text,
                      image: downloadUrl,
                      bannerImages: bannerUrls,
                      courses: [],
                      type: CoachingController.to.selectedType(),
                    ).save();
                    Get.snackbar(
                      "Done",
                      "Coaching Added",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                    Navigator.of(context).pop(true);
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
