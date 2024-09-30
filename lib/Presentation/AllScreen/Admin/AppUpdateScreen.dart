import 'dart:io';

import 'package:durbarclub/Core/appData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class AppUpdateScreen extends StatefulWidget {

  @override
  State<AppUpdateScreen> createState() => _AppUpdateScreenState();
}

class _AppUpdateScreenState extends State<AppUpdateScreen> {



  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                Image.asset("assets/notificationicon.png", height: 200,),
              ],
            ),
            Row(
              children: [
                Text("Update your\napplication to the\nlatest version", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: 20,),
            Text("A brand new version of the দুর্বার app is available in the ${Platform.isAndroid ? "Play" : "App"} Store. Please update your app to use all of our amazing features.", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: Get.height/6,),
            InkWell(
              onTap: () async {
                if (Platform.isAndroid) {
                  launchUrl(Uri.parse("https://play.google.com/store/apps/details?id=app.pronfc.android"), mode: LaunchMode.externalApplication);
                } else if (Platform.isIOS) {
                  launchUrl(Uri.parse(""), mode: LaunchMode.externalApplication);
                }
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    child: Text("Update Now", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                  )),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }}
