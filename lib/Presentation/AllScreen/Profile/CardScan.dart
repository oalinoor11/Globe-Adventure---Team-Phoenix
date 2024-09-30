import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:durbarclub/Controllers/profile_controller.dart';
import 'package:durbarclub/Core/AppRoutes.dart';
import 'package:durbarclub/Data/firebase_collections.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../../../Core/appData.dart';

class CardScan extends StatefulWidget {
  @override
  State<CardScan> createState() => _CardScanState();
}

class _CardScanState extends State<CardScan> {

  MobileScannerController scannerController = MobileScannerController();

  bool logoutLoader = false;

  @override
  void initState() {
    setState(() {
      Timer(Duration(milliseconds: 150), () {
        scannerController.start();
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: primaryColor,
        body: Column( mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            InkWell(
                onTap: () {
                  // Get.toNamed(AppRoutes.CARDSCANRESULT, arguments: "$domain/member-verification/727640050".split("/").last);
                },
                child: Text("Scan Durbar ID", style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),)),
            SizedBox(height: 20,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: Get.width - 80,
                  height: 450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: primaryColor,
                      width: 2,
                    ),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.4),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: MobileScanner(
                    fit: BoxFit.cover,
                    onDetect: (barcode, args) {
                      log("barcode: ${barcode.rawValue}");
                      // scannerController.stop();
                      Get.toNamed(AppRoutes.CARDSCANRESULT, arguments: barcode.rawValue.toString().split("/").last);
                    },
                    controller: scannerController,
                  ),
                ),
              ],
            ),
            Image.asset("assets/notificationicon.png", height: 100,),
          ],
        )
    );
  }

  _signOutDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (context, setState) {
                return AlertDialog(
                  title: Text("Sign Out"),
                  content: Text("Are you sure you want to sign out?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("No"),
                    ),
                    TextButton(
                      onPressed: () async {
                        setState(() {
                          logoutLoader = true;
                        });
                        await FirebaseMessaging.instance.unsubscribeFromTopic("all");
                        await FirebaseMessaging.instance.unsubscribeFromTopic(ProfileController.to.profile.value!.id.toString());
                        await FirebaseMessaging.instance.unsubscribeFromTopic(ProfileController.to.profile.value!.bloodGroup.toString());
                        await FirebaseAuth.instance.signOut();
                        Get.offAllNamed(AppRoutes.LOGINSCREEN);
                        setState(() {
                          logoutLoader = false;
                        });
                      },
                      child: logoutLoader ? CircularProgressIndicator() :
                      Text("Yes"),
                    ),
                  ],
                );});
        });
  }
}
