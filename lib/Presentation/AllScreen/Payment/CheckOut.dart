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

class CheckOut extends StatefulWidget {

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {

  String membershipFee = "";

  bool loading = false;


  @override
  void initState() {
    checkMembershipFee();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        title:
        Text(
          "Pay Membership Fee",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: membershipFee == "" ? Center(child: CircularProgressIndicator(color: primaryColor,)) :
      Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/membershipfee.png", height: 200,),
            ],
          ),
          Text("Membership Fee: ৳$membershipFee", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Text("Processing Fee: ৳${(int.parse(membershipFee) * 0.05).toStringAsFixed(0)}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          Text("Total: ৳${((int.parse(membershipFee))+(int.parse(membershipFee) * 0.05)).toStringAsFixed(0)}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),
          loading ? CircularProgressIndicator(color: primaryColor,) : InkWell(
              onTap: () async {
                var isPaymentComplete =
                    await Get.toNamed(
                    AppRoutes.SSLPAYMENTSCREEN, arguments: "${((int.parse(membershipFee))+(int.parse(membershipFee) * 0.05)).toStringAsFixed(0)}"
                );
                if (isPaymentComplete == true) {
                  setState(() {
                    loading = true;
                  });
                  ProfileModel profile = ProfileController.to.profile()!.copyWith(statusDetails: "Membership fee paid.");
                  await profile.save();
                  ProfileController.to.profile(profile);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text("Balance added successfully")));
                  await sendFCMMessage("New user request", "${ProfileController.to.profile.value!.name} paid membership fees & waiting for approval.", "oQIyjIwfH8QOyD1yVzNN4TuKLOE3");
                  Get.offAllNamed(AppRoutes.MAINSCREEN);

                  setState(() {
                    loading = false;
                  });
                }
                else {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(
                    content: Text("Payment Failed",
                        style: TextStyle(
                            fontWeight:
                            FontWeight.bold)),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: Container(
                height: 50, width: 120,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(child: Text("Pay Now", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),)))),
        ],
      ),
    );
  }
  checkMembershipFee() async {
    FirebaseFirestore.instance.collection("RULES").doc("a583h4WjRBP7z0j57BVq").get().then((value) {
      if(value.exists){
        setState(() {
          membershipFee = value.data()!["membershipFee"].toString();
        });
      }else{
        // Get.snackbar("Permission Denied", "You are not an admin");
      }
    });
}}
