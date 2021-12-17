import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AdmissionCoachingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Admission Coaching",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [Container(),
              const SizedBox(height: 200.0),
              RaisedButton(
                color: Colors.lightBlueAccent[700],
                textColor: Colors.white,
                child: Container(
                  height: 150.0,
                  width: 155.0,
                  child: Center(
                    child: Text(
                      "UCC",
                      style: TextStyle(
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                onPressed: ()
                {
                  print("clicked ucc");
                  Get.toNamed(AppRoutes.UCCSCREEN);
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
