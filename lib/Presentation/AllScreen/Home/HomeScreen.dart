import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:durbarclub/Controllers/profile_controller.dart';
import 'package:durbarclub/Core/AppRoutes.dart';
import 'package:durbarclub/Data/firebase_collections.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Core/appData.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool logoutLoader = false;


  @override
  void initState() {
    // FirebaseMessaging.instance.subscribeToTopic("dev");
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Image.asset("assets/logo.png"),
              ),
              SizedBox(height: 20,),
              Container(
                height: 1,
                color: Colors.grey.withOpacity(0.3),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse("https://play.google.com/store/apps/details?id=app.pronfc.android"), mode: LaunchMode.externalApplication);
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 25,
                                color: Colors.blue,
                              ),
                              Text(
                                " Rate Us",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                            color: Colors.brown,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                height: 1,
                color: Colors.grey.withOpacity(0.3),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  Share.share("https://play.google.com/store/apps/details?id=app.pronfc.android");
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.share,
                                size: 25,
                                color: Colors.green
                              ),
                              Text(
                                " Share App",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                            color: Colors.brown,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 1,
                color: Colors.grey.withOpacity(0.3),
              ),
              SizedBox(height: 20,),
              InkWell(
                onTap: () {
                  _signOutDialog();
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.logout,
                                size: 25,
                                color: Colors.red,
                              ),
                              Text(
                                " Logout",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 18,
                            color: Colors.brown,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 1,
                color: Colors.grey.withOpacity(0.3),
              ),
            ],
          ),
        ),
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title:
          Text(
            "দুর্বার সংঘ",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
          ),
          actions: [
            InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.NOTIFICATIONSCREEN);
              },
              onLongPress: (){
                FirebaseFirestore.instance.collection("RULES").doc("a583h4WjRBP7z0j57BVq").get().then((value) {
                  if(value.exists){
                    if(value.data()!["notificationsendPermission"].toString().contains(ProfileController.to.profile.value!.designation.toString())){
                      Get.toNamed(AppRoutes.SENDNOTIFICATION);
                    }else{
                      // Get.snackbar("Permission Denied", "You are not an admin");
                    }
                  }else{
                    // Get.snackbar("Permission Denied", "You are not an admin");
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 13.0),
                child: Icon(Icons.notifications, color: Colors.white),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children:[

            ]
          ),
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
                  backgroundColor: Colors.white,
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
                        // await FirebaseMessaging.instance.unsubscribeFromTopic(ProfileController.to.profile.value!.bloodGroup.toString());
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
