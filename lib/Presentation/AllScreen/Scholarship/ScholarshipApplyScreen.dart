import 'dart:io';

import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/appply_scholarship_form_model.dart';
import 'package:BornoBangla/Data/Models/scholarship_model.dart';
import 'package:BornoBangla/Presentation/Controllers/scholarship_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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
  File? _signaturePhoto;
  bool loader = false;

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
        automaticallyImplyLeading: false,
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
                    labelText: "Mother's Name",
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
                  keyboardType: TextInputType.name,
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
                    if (pickedFile != null) {
                      setState(() {
                        _studentsPhoto = File(pickedFile.path);
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
                    child: _studentsPhoto == null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Student's Photo",
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
                        : Image.file(_studentsPhoto!),
                  ),
                ),
                Text(
                  "(image ratio should be 1/1)",
                  style: TextStyle(color: Colors.grey),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "By clicking ",
                      style: TextStyle(color: Colors.black87, fontSize: 11),
                    ),
                    Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 11),
                    ),
                    Text(
                      ", you are agreeing to the",
                      style: TextStyle(color: Colors.black87, fontSize: 11),
                    ),
                    TextButton(
                      onPressed: () async {
                        await launch(
                          "https://drive.google.com/file/d/1BAnNHhmwrYWABwOlSXNO3uebgwsYHxuR/view?usp=sharing",
                        );
                      },
                      child: Text(
                        "terms & conditions",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 11),
                      ),
                    ),
                  ],
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
                            if (_studentsPhoto != null &&
                                _nameController.text.isNotEmpty &&
                                _fatherNameController.text.isNotEmpty &&
                                _motherNameController.text.isNotEmpty &&
                                _presentAddressController.text.isNotEmpty &&
                                _studentsPhoneController.text.isNotEmpty &&
                                _parentsPhoneController.text.isNotEmpty &&
                                _emailAddressController.text.isNotEmpty &&
                                _sscResultController.text.isNotEmpty &&
                                _hscResultController.text.isNotEmpty) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              var isPaymentComplete = await Get.toNamed(
                                  AppRoutes.PAYMENTSCREEN,
                                  arguments: 5000.0);
                              if (isPaymentComplete == true) {
                                setState(() {
                                  loader = true;
                                });
                                var upload = await FirebaseStorage.instance
                                    .ref()
                                    .child("student_images")
                                    .child(_nameController.text)
                                    .putFile(_studentsPhoto!);
                                var studentImageUrl =
                                    await upload.ref.getDownloadURL();
                                var tempData = await screenshotController
                                    .capture(pixelRatio: 10);
                                var signatureImageUrl;
                                if (tempData != null) {
                                  final directory =
                                      await getApplicationDocumentsDirectory();
                                  _signaturePhoto =
                                      await File('${directory.path}/image.png')
                                          .create();
                                  await _signaturePhoto!.writeAsBytes(tempData);

                                  upload = await FirebaseStorage.instance
                                      .ref()
                                      .child("student_images")
                                      .child(_nameController.text)
                                      .putFile(_signaturePhoto!);
                                  signatureImageUrl =
                                      await upload.ref.getDownloadURL();
                                }
                                AppplyScholarshipFormModel
                                    appplyScholarshipFormModel =
                                    AppplyScholarshipFormModel(
                                  name: _nameController.text,
                                  email: _emailAddressController.text,
                                  studentsPhone: _studentsPhoneController.text,
                                  parentsPhone: _parentsPhoneController.text,
                                  fathersName: _fatherNameController.text,
                                  mothersName: _motherNameController.text,
                                  addressName: _presentAddressController.text,
                                  sscResult: _sscResultController.text,
                                  hscResult: _hscResultController.text,
                                  referralCode: _referralCodeController.text,
                                  image: studentImageUrl,
                                  signature: signatureImageUrl,
                                  course: ScholarshipController.to.course(),
                                  university:
                                      ScholarshipController.to.university(),
                                );
                                await appplyScholarshipFormModel.save();
                                var result = await http.get(
                                  Uri(
                                    scheme: "http",
                                    host: "msg.elitbuzz-bd.com",
                                    path: "/smsapi",
                                    queryParameters: {
                                      "api_key":
                                          "C20081696225eaffaf0075.13009072",
                                      "type": "text",
                                      "contacts":
                                          _studentsPhoneController.text.trim(),
                                      "senderid": "37935",
                                      "msg":
                                          "বর্ণবাংলা অ্যাপ -এ আপনার আবেদনটি গ্রহণ করা হয়েছে, পরবর্তী আপডেটের জন্য অপেক্ষা করুন।",
                                    },
                                  ),
                                );
                                await Get.snackbar(
                                  "Application Submitted",
                                  "Your Application has been submitted",
                                  backgroundColor: Colors.green,
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.white,
                                );
                                Get.offAllNamed(AppRoutes.MAINSCREEN);
                                setState(() {
                                  loader = false;
                                });
                              } else {
                                Get.snackbar(
                                  "Payment Failed",
                                  "Payment is not complete",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.red,
                                  colorText: Colors.white,
                                );
                              }
                            } else {
                              Get.snackbar(
                                "Failed!",
                                "Fill up all field",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                              return;
                            }
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
