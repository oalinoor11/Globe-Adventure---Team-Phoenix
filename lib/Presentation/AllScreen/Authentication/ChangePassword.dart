import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../Controllers/profile_controller.dart';
import 'package:http/http.dart' as http;
import '../../../Core/AppRoutes.dart';
import '../../../main.dart';
import '../../ad_helper.dart';

class ChangePassword extends StatefulWidget {

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController oldpasswordTextEditingController = TextEditingController();
  // TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController newpasswordTextEditingController = TextEditingController();
  TextEditingController confirmpasswordTextEditingController = TextEditingController();
  TextEditingController OTPEditingController = TextEditingController();

  bool load = false;
  bool passwordVisible = true;
  bool password2Visible = true;
  bool password3Visible = true;
  String otp = "";


  @override
  void initState() {
    super.initState();
    sendOtp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFF7F00),
        centerTitle: false,
        title:
        Text(
          "Change Password",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
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
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.0,
                        ),
                        TextField(
                          controller: oldpasswordTextEditingController,
                          keyboardType: TextInputType.text,
                          obscuringCharacter: "*",
                          obscureText: passwordVisible,
                          decoration: InputDecoration(
                            labelText: "Current Password",
                            labelStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  passwordVisible = !passwordVisible;
                                });
                              },
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: OTPEditingController,
                          keyboardType: TextInputType.number,
                          // obscuringCharacter: "*",
                          // obscureText: passwordVisible,
                          decoration: InputDecoration(
                            labelText: "Verification Code",
                            labelStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            ),
                            // suffixIcon: IconButton(
                            //   icon: Icon(
                            //     // Based on passwordVisible state choose the icon
                            //     passwordVisible
                            //         ? Icons.visibility
                            //         : Icons.visibility_off,
                            //     color: Theme.of(context).primaryColorDark,
                            //   ),
                            //   onPressed: () {
                            //     // Update the state i.e. toogle the state of passwordVisible variable
                            //     setState(() {
                            //       passwordVisible = !passwordVisible;
                            //     });
                            //   },
                            // ),
                          ),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: newpasswordTextEditingController,
                          keyboardType: TextInputType.text,
                          obscuringCharacter: "*",
                          obscureText: password2Visible,
                          decoration: InputDecoration(
                            labelText: "New Password",
                            labelStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                password2Visible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  password2Visible = !password2Visible;
                                });
                              },
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextField(
                          controller: confirmpasswordTextEditingController,
                          keyboardType: TextInputType.text,
                          obscuringCharacter: "*",
                          obscureText: password3Visible,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(fontSize: 18.0),
                            border: OutlineInputBorder(),
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 10.0,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                password3Visible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Theme.of(context).primaryColorDark,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  password3Visible = !password3Visible;
                                });
                              },
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        load ? CircularProgressIndicator() : InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(10.0),
                                color: Colors.deepOrange
                            ),
                            height: 50.0,
                            child: Center(
                              child: Text(
                                "Submit",
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontFamily: "bolt-semibold",
                                    color: Colors.white
                                ),
                              ),
                            ),
                          ),
                          onTap: () async {
                            if (newpasswordTextEditingController.text.length < 6) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    "Week Password!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                                ),
                              );
                            } else if (oldpasswordTextEditingController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    "Invalid old password!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                                ),
                              );
                            }
                            else {
                              if(otp == OTPEditingController.text){
                                if(newpasswordTextEditingController.text == confirmpasswordTextEditingController.text){
                                  setState(() {
                                    load = true;
                                  });
                                  final User? firebaseuser = (await FirebaseAuth.instance
                                      .signInWithEmailAndPassword(
                                      email: ProfileController.to.profile.value!.email,
                                      password: oldpasswordTextEditingController.text)
                                      .catchError((errMsg) {
                                    print(errMsg.toString());
                                    setState(() {
                                      load = false;
                                    });
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          "Invalid old password!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                                      ),
                                    );
                                  })).user;
                                  if(firebaseuser != null){
                                    FirebaseAuth.instance.currentUser!.updatePassword(newpasswordTextEditingController.text).then((_) {
                                      setState(() {
                                        load = false;
                                      });
                                      Get.back();
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.green,
                                          content: Text(
                                            "Password changed successfully!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                                        ),
                                      );
                                    }).catchError((error) {
                                      print(error);
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.red,
                                          content: Text(
                                            "Password can't be changed!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                                        ),
                                      );
                                    });
                                  }
                                }
                                else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text(
                                        "New password and Confirm password must be same!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                                    ),
                                  );
                                }
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.red,
                                    content: Text(
                                      "Invalid OTP!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                                  ),
                                );
                              }
                            }
                            print("clicked reset button");
                          },
                        ),
                      ],
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
  sendOtp() async {
    String numbers = Random().nextInt(999999).toString();
    setState(() {
      otp = numbers;
    });
    print(otp);
    sendEmail();
  }

  sendEmail() async {
    final serviceId = 'service_wv9l9dn';
    final templateId = 'template_uyoi7j9';
    final userId = '4G35R8KG0EJyYq2Pq';
    final token = 'tZrALYJeO0lrc31Sf0hCS';
    final url = Uri.parse(
        'https://api.emailjs.com/api/v1.0/email/send-form');
    final response = await http.post(url, body: {
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': userId,
      'accessToken': token,
      'receiver': ProfileController.to.profile.value!.email,
      'subject': "SixeR One Time Password(OTP)",
      'h1': "Dear ${ProfileController.to.profile.value!.name},\n\nGreetings from SixeR, The World's #1 Growing Trading Platform.\n\nTo ensure the security of your SixeR trading account, we have generated a one-time password (OTP) for your current action. Please enter the OTP below to proceed:\n\nYour One-Time Password (OTP): ",
      'h2': "${otp}",
      'h3': "\n\nNote: This OTP is valid for a single use and will expire in 10 minutes. Do not share this OTP with anyone, including SixeR support.\n\nIf you did not initiate this action or are experiencing any issues, please contact our support team immediately.\n\nThank you for choosing SixeR for your trading needs.\n\nBest Regards,\nThe SixeR Team"
    });
    print("shahed"+response.body);
  }
}
