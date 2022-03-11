import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Core/AppRoutes.dart';

class OtpScreen extends StatefulWidget {

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController otpTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [Container(),
            SizedBox(height: 80.0,),
            Image(image: AssetImage("assets/coppedlogo.png"),
            height: 180, alignment: Alignment.center),

            SizedBox(height: 10.0,),

            Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
            children: [

            SizedBox(height: 5.0,),
            TextField(
            controller: otpTextEditingController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(labelText: "Enter OTP",
            labelStyle: TextStyle(
            fontSize: 14.0),
            hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 10.0,
            ),
            ),
            style: TextStyle(
            fontSize: 14.0,
            ),
            ),
              const SizedBox(height: 20.0),
              InkWell(
                child: Container(
                  height: 50.0,
                  width: 100.0,
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 5.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Center(
                      child: Text(
                        "verify",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  Get.offAllNamed(AppRoutes.SIGNINSCREEN);
                  Get.snackbar(
                    "Congratulations!",
                    "Your account has been Created successfully",
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.blue,
                    colorText: Colors.white,
                  );
                },
              ),
            ],
          ),
        ),
      ]),
    )));
  }
}

