import 'dart:io';

import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/appointment_application_model.dart';
import 'package:BornoBangla/Data/Models/coach_model.dart';
import 'package:BornoBangla/Presentation/Controllers/profile_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class BookAppointmentScreen extends StatefulWidget {
  @override
  State<BookAppointmentScreen> createState() => _BookAppointmentScreenState();
}

class _BookAppointmentScreenState extends State<BookAppointmentScreen> {
  GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();

  double? amount;
  double? rupee;
  double? usd;

  ScreenshotController screenshotController = ScreenshotController();

  TextEditingController nameController =
      TextEditingController(text: ProfileController.to.profile()!.name);
  TextEditingController referralController = TextEditingController();
  TextEditingController phoneController =
      TextEditingController(text: ProfileController.to.profile()!.phone);
  TextEditingController emailController =
      TextEditingController(text: ProfileController.to.profile()!.email);
  TextEditingController ageController = TextEditingController(
      text: ProfileController.to.profile()!.age.toString());
  TextEditingController professionController =
      TextEditingController(text: ProfileController.to.profile()!.profession);
  TextEditingController purposeOfMeetingController = TextEditingController();
  File? image;
  CoachModel coachModel = Get.arguments;
  bool isLoading = false;

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
                "Book an Appointment",
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
                  SizedBox(height: 20),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
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
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Colors.green, width: 1)),
                      labelText: "Your Email Address",
                      labelStyle:
                          TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: ageController,
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
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
                  TextField(
                    controller: purposeOfMeetingController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Colors.green, width: 1)),
                      labelText: "Purpose of Meeting",
                      labelStyle:
                          TextStyle(fontSize: 16.0, color: Colors.black),
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
                          ? ProfileController.to.profile()!.profilePicture !=
                                  null
                              ? Image.network(ProfileController.to
                                  .profile()!
                                  .profilePicture!)
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Your Photo",
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
                          : Image.file(image!),
                    ),
                  ),
                  Text(
                    "(image ratio should be 1/1)",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: referralController,
                    keyboardType: TextInputType.text,
                    cursorColor: Colors.green,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide:
                              BorderSide(color: Colors.green, width: 1)),
                      labelText: "Referral Code (optional)",
                      labelStyle:
                          TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 10),
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
                    child: isLoading
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
                              if (image != null &&
                                  nameController.text.isNotEmpty &&
                                  phoneController.text.isNotEmpty &&
                                  emailController.text.isNotEmpty &&
                                  ageController.text.isNotEmpty &&
                                  professionController.text.isNotEmpty &&
                                  purposeOfMeetingController.text.isNotEmpty) {
                                if (coachModel.currency.toString() == "৳") {
                                  amount = coachModel.price?.toDouble();
                                } else if (coachModel.currency.toString() ==
                                    "₹") {
                                  rupee = coachModel.price?.toDouble();
                                  amount = (rupee! * 1.2).toDouble();
                                } else if (coachModel.currency.toString() ==
                                    "\$") {
                                  usd = coachModel.price?.toDouble();
                                  amount = (usd! * 85).toDouble();
                                }
                                ;

                                FocusManager.instance.primaryFocus?.unfocus();
                                var isPaymentComplete = await Get.toNamed(
                                    AppRoutes.PAYMENTSCREEN,
                                    arguments: amount);
                                if (isPaymentComplete == true) {
                                  setState(() {
                                    isLoading = true;
                                  });
                                  var upload = await FirebaseStorage.instance
                                      .ref()
                                      .child("coach_appointment_images")
                                      .child(nameController.text)
                                      .putFile(image!);
                                  var downloadUrl =
                                      await upload.ref.getDownloadURL();

                                  AppointmentApplicationModel(
                                    name: nameController.text,
                                    referral: referralController.text,
                                    phone: phoneController.text,
                                    email: emailController.text,
                                    age: ageController.text,
                                    profession: professionController.text,
                                    purposeOfMeeting:
                                        purposeOfMeetingController.text,
                                    image: downloadUrl,
                                    coachModel: coachModel,
                                  ).save();
                                  setState(() {
                                    isLoading = false;
                                  });
                                  // http://msg.elitbuzz-bd.com/smsapi?api_key=C20081696225eaffaf0075.13009072&type=text&contacts=01798161323&senderid=37935&msg=Test message one
                                  var result = await http.get(
                                    Uri(
                                      scheme: "http",
                                      host: "msg.elitbuzz-bd.com",
                                      path: "/smsapi",
                                      queryParameters: {
                                        "api_key":
                                            "C20081696225eaffaf0075.13009072",
                                        "type": "text",
                                        "contacts": phoneController.text.trim(),
                                        "senderid": "37935",
                                        "msg":
                                            "আপনি সফলভাবে বর্ণবাংলা অ্যাপ -এ এপয়েন্টমেন্টের জন্য আবেদন করেছেন।",
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
                                    isLoading = false;
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
      ),
    );
  }
}
