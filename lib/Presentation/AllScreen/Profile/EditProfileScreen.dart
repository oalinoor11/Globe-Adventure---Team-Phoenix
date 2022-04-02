import 'dart:io';

import 'package:BornoBangla/Presentation/Controllers/profile_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Core/AppRoutes.dart';
import '../../../Data/Models/profile_model.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // ProfileModel profileModel = Get.arguments;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController professionController;

  bool loader = false;
  File? image;

  // @override
  // void initState() {
  //   nameController.text = profileModel.name;
  //   phoneController.text = profileModel.phone;
  //   emailController.text = profileModel.email;
  //   super.initState();
  // }
  @override
  void initState() {
    nameController =
        TextEditingController(text: ProfileController.to.profile()!.name);
    phoneController =
        TextEditingController(text: ProfileController.to.profile()!.phone);
    emailController =
        TextEditingController(text: ProfileController.to.profile()!.email);
    addressController =
        TextEditingController(text: ProfileController.to.profile()!.address);
    professionController =
        TextEditingController(text: ProfileController.to.profile()!.profession);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: context.width > 550 ? BoxDecoration(border: Border.all(width: 2, color: Colors.grey.withOpacity(0.35))): null,
      width: context.width > 550 ? 550 : double.infinity,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Center(
            child: Text(
              "Edit Profile",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 10),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      var pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          image = File(pickedFile.path);
                        });
                      }
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: new BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: image == null
                            ? Image(
                                image: NetworkImage(ProfileController.to
                                            .profile()!
                                            .profilePicture !=
                                        null
                                    ? ProfileController.to
                                        .profile()!
                                        .profilePicture!
                                    : "https://firebasestorage.googleapis.com/v0/b/bornobangla-48c47.appspot.com/o/samplepropic.png?alt=media&token=cdd47354-ad50-43f3-9c03-752265b83605"),
                                fit: BoxFit.cover,
                              )
                            : Image.file(image!),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelText: "Your Name",
                      labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelText: "Your Phone",
                      labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelText: "Your Email",
                      labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: professionController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelText: "Your Profession",
                      labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: addressController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: Colors.green, width: 1)),
                      labelText: "Your Address",
                      labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                        setState(() {
                          loader = true;
                        });
                        ProfileModel profile =
                            ProfileController.to.profile()!.copyWith(
                                  name: nameController.text,
                                  phone: phoneController.text,
                                  address: addressController.text,
                                  profession: professionController.text,
                                );
                        if (image != null) {
                          var upload = await FirebaseStorage.instance
                              .ref()
                              .child("profile_pictures")
                              .child(nameController.text)
                              .putFile(image!);
                          var downloadUrl = await upload.ref.getDownloadURL();
                          profile = profile.copyWith(
                            profilePicture: downloadUrl,
                          );
                        }
                        await profile.save();
                        ProfileController.to.profile(profile);

                        setState(() {
                          loader = false;
                        });
                        Get.snackbar(
                          "Success",
                          "Profile updated successfully",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green,
                          borderRadius: 8,
                          snackStyle: SnackStyle.FLOATING,
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(8),
                          animationDuration: Duration(milliseconds: 500),
                        );
                        Get.offAllNamed(AppRoutes.MAINSCREEN);
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
