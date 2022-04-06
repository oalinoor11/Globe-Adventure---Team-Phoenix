import 'dart:io';

import 'package:BornoBangla/Presentation/Controllers/profile_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../../Core/AppRoutes.dart';
import '../../../Data/Models/profile_model.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  ProfileModel profileModel = ProfileController.to.profile()!;
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController professionController;
  late TextEditingController fatherName;
  late TextEditingController motherName;
  late TextEditingController parentPhone;
  late TextEditingController sscResult;
  late TextEditingController hscResult;
  late TextEditingController age;

  bool loader = false;
  File? image;
  String? signatureUrl;
  bool editSignature = false;

  var screenshotController = ScreenshotController();

  var _signaturePadKey = GlobalKey();
  @override
  void initState() {
    nameController = TextEditingController(text: profileModel.name);
    phoneController = TextEditingController(text: profileModel.phone);
    emailController = TextEditingController(text: profileModel.email);
    addressController = TextEditingController(text: profileModel.address);
    professionController = TextEditingController(text: profileModel.profession);
    fatherName = TextEditingController(text: profileModel.fatherName);
    motherName = TextEditingController(text: profileModel.motherName);
    parentPhone = TextEditingController(text: profileModel.parentPhone);
    sscResult = TextEditingController(text: profileModel.sscResult?.toString());
    hscResult = TextEditingController(text: profileModel.hscResult?.toString());
    age = TextEditingController(text: profileModel.age?.toString());
    signatureUrl = profileModel.signatureImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: context.width > 550
            ? BoxDecoration(
                border:
                    Border.all(width: 2, color: Colors.grey.withOpacity(0.35)))
            : null,
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
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 20, bottom: 10),
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
                                      : "https://firebasestorage.googleapis.com/v0/b/bornobangla-48c47.appspot.com/o/samplepropic.png?alt=media&token=f0380d2e-9d9b-4082-a96d-d50c8f8bc4f5"),
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
                            borderSide:
                                BorderSide(color: Colors.green, width: 1)),
                        labelText: "Your Name",
                        labelStyle:
                            TextStyle(fontSize: 16.0, color: Colors.black),
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
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.green, width: 1)),
                        labelText: "Your Phone",
                        labelStyle:
                            TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
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
                            borderSide:
                                BorderSide(color: Colors.green, width: 1)),
                        labelText: "Your Profession",
                        labelStyle:
                            TextStyle(fontSize: 16.0, color: Colors.black),
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
                            borderSide:
                                BorderSide(color: Colors.green, width: 1)),
                        labelText: "Your Address",
                        labelStyle:
                            TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: age,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.green, width: 1)),
                        labelText: "Your Age",
                        labelStyle:
                            TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: fatherName,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.green, width: 1)),
                        labelText: "Father's Name",
                        labelStyle:
                            TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: motherName,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.green, width: 1)),
                        labelText: "Mother's Name",
                        labelStyle:
                            TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: parentPhone,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.green, width: 1)),
                        labelText: "Parent's Phone",
                        labelStyle:
                            TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      ],
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: sscResult,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.green, width: 1)),
                        labelText: "SSC Result",
                        labelStyle:
                            TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: hscResult,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide:
                                BorderSide(color: Colors.green, width: 1)),
                        labelText: "HSC Result",
                        labelStyle:
                            TextStyle(fontSize: 16.0, color: Colors.black),
                      ),
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                      child: profileModel.signatureImage == null
                          ? Screenshot(
                              controller: screenshotController,
                              child: SfSignaturePad(
                                key: _signaturePadKey,
                                backgroundColor: Colors.grey[200],
                              ),
                            )
                          : editSignature
                              ? Stack(
                                  children: [
                                    Screenshot(
                                      controller: screenshotController,
                                      child: SfSignaturePad(
                                        key: _signaturePadKey,
                                        backgroundColor: Colors.grey[200],
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.clear,
                                          color: Colors.red,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            profileModel.signatureImage = null;
                                            editSignature = false;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              : Stack(
                                  children: [
                                    Image.network(
                                      profileModel.signatureImage!,
                                      fit: BoxFit.fill,
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.edit,
                                          color: Colors.green,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            editSignature = true;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
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
                                          age: int.tryParse(age.text) ?? 0,
                                          fatherName: fatherName.text,
                                          motherName: motherName.text,
                                          parentPhone: parentPhone.text,
                                          sscResult: sscResult.text,
                                          hscResult: hscResult.text,
                                        );
                                if (image != null) {
                                  var upload = await FirebaseStorage.instance
                                      .ref()
                                      .child("profile_pictures")
                                      .child(nameController.text)
                                      .putFile(image!);
                                  var downloadUrl =
                                      await upload.ref.getDownloadURL();
                                  profile = profile.copyWith(
                                    profilePicture: downloadUrl,
                                  );
                                }
                                var tempData = await screenshotController
                                    .capture(pixelRatio: 10);
                                var signatureImageUrl;
                                if (tempData != null) {
                                  final directory =
                                      await getApplicationDocumentsDirectory();
                                  var _signaturePhoto =
                                      await File('${directory.path}/image.png')
                                          .create();
                                  await _signaturePhoto.writeAsBytes(tempData);

                                  var upload = await FirebaseStorage.instance
                                      .ref()
                                      .child("signatures")
                                      .child(nameController.text)
                                      .putFile(_signaturePhoto);
                                  signatureImageUrl =
                                      await upload.ref.getDownloadURL();
                                  profile = profile.copyWith(
                                    signatureImage: signatureImageUrl,
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
                                  animationDuration:
                                      Duration(milliseconds: 500),
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
      ),
    );
  }
}
