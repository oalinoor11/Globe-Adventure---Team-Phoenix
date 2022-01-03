import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdmissionCoachingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title:
            // Image.asset("assets/logo.png", height: 130),
            Text(
          "Admission Coaching",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          Container(),
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 1 / 1,
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Container(
                      decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey),
                        image: DecorationImage(
                            image: AssetImage("assets/ucclogo.png")),
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            blurRadius: 5.0,
                          ),
                        ],
                      ),
                      child: Stack(children: [
                        Positioned(
                            left: 0,
                            right: 0,
                            bottom: 0,
                            child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                  color: Colors.white.withOpacity(0.75),
                                ),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                     child: Text(
                                    "UCC",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                  ),
                                )))),
                      ]),
                    ),
                    onTap: () {
                      Get.toNamed(AppRoutes.UCCSCREEN);
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
