import 'package:BornoBangla/AllWidgets/progressDialog.dart';
import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/profile_model.dart';
import 'package:BornoBangla/Presentation/Controllers/profile_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import '../../../main.dart';
import '../mainscreen.dart';

class SignInScreen extends StatelessWidget {
  static const String idScreen = "login";

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(),
              SizedBox(
                height: 80.0,
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
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
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
                      controller: passwordTextEditingController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
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
                      height: 20.0,
                    ),
                    RaisedButton(
                      color: Colors.green,
                      textColor: Colors.white,
                      child: Container(
                        height: 50.0,
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontFamily: "bolt-semibold",
                            ),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(24.0),
                      ),
                      onPressed: () async {
                        if (!emailTextEditingController.text.contains("@")) {
                          Get.snackbar(
                            "Invalid Email!",
                            "Enter correct email address",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        } else if (passwordTextEditingController.text.isEmpty) {
                          Get.snackbar(
                            "Password Required!",
                            "Enter your account password",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                        } else {
                          await loginAndAuthenticateUser(context);
                        }
                        print("clicked Login button");
                      },
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.offAllNamed(AppRoutes.SIGNUPSCREEN);
                  print("clicked to go signup");
                },
                child: Text(
                  "Do not have an Account? Register Here.",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<void> loginAndAuthenticateUser(BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(message: "Authenticating, Please wait...");
        });

    final User? firebaseuser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: emailTextEditingController.text,
                password: passwordTextEditingController.text)
            .catchError((errMsg) {
      print(errMsg.toString());
      Get.back();
      Get.snackbar(
        "Login Failed!",
        "Invalid Login information",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }))
        .user;

    if (firebaseuser != null) {
      print("User is not null");
      try {
        ProfileModel profileModel =
            await ProfileModel.getProfileByUserId(uId: firebaseuser.uid);
        ProfileController.to.profile(profileModel);
      } on Exception catch (e) {
        print(e.toString());
      }
      Get.snackbar(
        "Login Success!",
        "You are logged in",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      Get.offAllNamed(AppRoutes.MAINSCREEN);
    } else {
      print("User is null");
    }
  }
}
