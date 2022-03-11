import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../Core/AppRoutes.dart';

class OtpScreen extends StatefulWidget {

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [Container(),
              const SizedBox(height: 200.0),
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
                        "otp verification",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  Get.offAllNamed(AppRoutes.SIGNINSCREEN);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

