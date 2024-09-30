import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:durbarclub/Core/appData.dart';
import 'package:durbarclub/Presentation/AllScreen/Blood/BloodScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../Controllers/profile_controller.dart';
import '../../Core/AppRoutes.dart';
import 'Home/HomeScreen.dart';
import 'Profile/CardScreen.dart';
import 'Team/TeamScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    checkUpdate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        selectedItemColor: Colors.white,
        onTap: (index) {
          pageController.jumpToPage(index);
          setState(() {
            currentIndex = index;
          });
          // pageController.animateToPage(index, duration: Duration(seconds: 0), curve: Curves.ease);
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed),
            label: "Feed",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.bloodtype),
            label: "Blood",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: "Team",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.card_membership),
            label: "Card",
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [
          HomeScreen(),
          BloodScreen(),
          TeamScreen(),
          CardScreen(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  checkUpdate() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    FirebaseFirestore.instance.collection("RULES").doc("a583h4WjRBP7z0j57BVq").get().then((value) {
      if(value.exists){
          if (Platform.isAndroid) {
            if(value.data()!["androidVersion"].toString() != packageInfo.version.toString()){
              Get.offAllNamed(AppRoutes.APPUPDATESCREEN);
            }
            else{
              checkPayment();
            }
          } else if (Platform.isIOS) {
            if(value.data()!["iOSVersion"].toString() != packageInfo.version.toString()){
              // Get.offAllNamed(AppRoutes.APPUPDATESCREEN);
              checkPayment();
            }
            else{
              checkPayment();
            }
          }
      }else{
        // Get.snackbar("Permission Denied", "You are not an admin");
      }
    });
  }
  checkPayment() async {
    await Future.delayed(Duration(seconds: 1));
    if(ProfileController.to.profile.value!.statusDetails.toString() == "Membership fee not paid yet."){
      Get.offAllNamed(AppRoutes.CHECKOUT);
    }
    else if(ProfileController.to.profile.value!.status.toString() == "Suspended" || ProfileController.to.profile.value!.status.toString() == "Inactive" || ProfileController.to.profile.value!.status.toString() == "Pending" || ProfileController.to.profile.value!.status.toString() == "Rejected" || ProfileController.to.profile.value!.status.toString() == "Expired" || ProfileController.to.profile.value!.status.toString() == "Cancelled" || ProfileController.to.profile.value!.status.toString() == "Terminated" || ProfileController.to.profile.value!.status.toString() == "Deleted" || ProfileController.to.profile.value!.status.toString() == "Not Approved"){
      Get.offAllNamed(AppRoutes.SUSPENDUSER, arguments: ProfileController.to.profile.value!.status.toString());
    }
    else{
      // Get.offAllNamed(AppRoutes.SUSPENDUSER, arguments: ProfileController.to.profile.value!.status.toString());
    }
  }
}
