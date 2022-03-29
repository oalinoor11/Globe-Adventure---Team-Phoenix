import 'package:BornoBangla/AllWidgets/progressDialog.dart';
import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/profile_model.dart';
import 'package:BornoBangla/Presentation/Controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import '../../../Data/firebase_collections.dart';
import '../../../main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  static const String idScreen = "register";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextEditingController = TextEditingController();

  TextEditingController phoneTextEditingController = TextEditingController();

  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              width: context.width > 550 ? 550 : double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(),
                  SizedBox(
                    height: 50.0,
                  ),
                  Image(
                    image: AssetImage("assets/coppedlogo.png"),
                    height: 180,
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.0,
                        ),
                        TextField(
                          controller: nameTextEditingController,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            labelText: "Name",
                            labelStyle: TextStyle(fontSize: 14.0),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TextField(
                          controller: phoneTextEditingController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            labelText: "Phone",
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "bolt-semibold",
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TextField(
                          controller: emailTextEditingController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "bolt-semibold",
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TextField(
                          controller: passwordTextEditingController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Password",
                            labelStyle: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "bolt-semibold",
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        RaisedButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Container(
                            height: 50.0,
                            child: Center(
                              child: Text(
                                "Create Account",
                                style: TextStyle(fontSize: 18.0),
                              ),
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(24.0),
                          ),
                          onPressed: () async {
                            if (nameTextEditingController.text.length < 3) {
                              Get.snackbar(
                                "Error!",
                                "Enter your name",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            } else if (phoneTextEditingController.text.isEmpty) {
                              Get.snackbar(
                                "Phone Number Required!",
                                "Enter your phone number",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            } else if (!emailTextEditingController.text
                                .contains("@")) {
                              Get.snackbar(
                                "Invalid Email!",
                                "Enter correct email address",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            } else if (passwordTextEditingController.text.length <
                                6) {
                              Get.snackbar(
                                "Error!",
                                "Password must be atleast 6 character",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            } else {
                              registerNewUser(context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offAllNamed(AppRoutes.SIGNINSCREEN);
                      print("clicked to go login");
                    },
                    child: Text(
                      "Already have an Account? Login Here.",
                      style: TextStyle(color: Colors.grey),
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

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(message: "Creating your account");
        });

    final User? firebaseuser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      Navigator.pop(context);
      Get.snackbar(
        "Failed!",
        "You already have an account",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }))
        .user;

    if (firebaseuser != null) //user created
    {
      var profile = ProfileModel(
        id: firebaseuser.uid,
        name: nameTextEditingController.text,
        phone: phoneTextEditingController.text,
        email: emailTextEditingController.text,
      )..save();
      ProfileController.to.profile(profile);
      Get.snackbar(
        "Congratulations!",
        "Your account has been Created successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      var result = await http.get(
        Uri(
          scheme: "http",
          host: "msg.elitbuzz-bd.com",
          path: "/smsapi",
          queryParameters: {
            "api_key": "C20081696225eaffaf0075.13009072",
            "type": "text",
            "contacts": phoneTextEditingController.text.trim(),
            "senderid": "37935",
            "msg":
                "ধন্যবাদ, আপনি সফলভাবে বর্ণবাংলা অ্যাপ -এ রেজিস্ট্রেশন সম্পন্ন করেছেন।",
          },
        ),
      );

      Get.toNamed(AppRoutes.MAINSCREEN);
    } else {
      Navigator.pop(context);
      Get.snackbar(
        "Failed!",
        "Enter your account password",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
