import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:durbarclub/Core/appData.dart';
import 'package:durbarclub/Presentation/AllScreen/Notification/sendFCMMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../../Controllers/profile_controller.dart';
import 'package:http/http.dart' as http;
import '../../../../Core/AppRoutes.dart';
import '../../../../main.dart';
import '../../../Data/Models/profile_model.dart';

class SuspendUser extends StatefulWidget {

  @override
  State<SuspendUser> createState() => _SuspendUserState();
}

class _SuspendUserState extends State<SuspendUser> {

  String status = Get.arguments;


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Your Durbar ID is ", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
              Text("$status", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),),
            ],
          ),
          Image.asset("assets/invalid membericon.png"),
        ],
      ),
    );
  }}
