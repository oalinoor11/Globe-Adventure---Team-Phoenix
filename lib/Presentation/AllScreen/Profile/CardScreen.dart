import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:durbarclub/Controllers/profile_controller.dart';
import 'package:durbarclub/Core/AppRoutes.dart';
import 'package:durbarclub/Data/firebase_collections.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Core/appData.dart';

class CardScreen extends StatefulWidget {
  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {

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
          InkWell(
            onTap: (){
              // print("${DateTime.now().millisecondsSinceEpoch}");
            },
            child: Text(
              "দুর্বার সংঘ",
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
            ),
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
                Get.toNamed(AppRoutes.CARDSCAN);
                // Get.toNamed(AppRoutes.CARDSCANRESULT, arguments: "oQIyjIwfH8QOyD1yVzNN4TuKLOE3");
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 13.0),
                child: Icon(Icons.qr_code_scanner, color: Colors.white),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
              children:[
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
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
                        child: Column(
                          children: [
                            SizedBox(height: 25,),
                            GestureDetector(
                              child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.center,
                                  children: <Widget> [
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: new BoxDecoration(
                                        border:
                                        Border.all(color: Colors.blue, width: 1.5),
                                        borderRadius: BorderRadius.circular(100),
                                      ),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(100),
                                          child: Image.network(ProfileController.to.profile.value!.image.toString())),
                                    ),
                                      ProfileController.to.profile.value!.verified.toString() == "true" ? Positioned(
                                      left: 65,
                                      top: 70,
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: new BoxDecoration(
                                          boxShadow: [
                                            new BoxShadow(
                                              color: Colors.white,
                                              blurRadius: 0,
                                            ),
                                          ],
                                          border: Border.all(color: primaryColor, width: 1),
                                          borderRadius: BorderRadius.circular(100),
                                        ),
                                        child: Container(child: Icon(Icons.verified, size: 20, color: Colors.blue,)),
                                      ),
                                    ) : SizedBox(),
                                  ]
                              ),
                            ),
                            SizedBox(height: 10,),
                            Text("ID: "+
                              ProfileController.to.profile.value!.memberId.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 0,),
                            Text(ProfileController.to.profile.value!.designation.toString(),
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 15,),
                            Text("Name: "+
                              ProfileController.to.profile.value!.name.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text("Phone: "+
                              ProfileController.to.profile.value!.phone.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text("Email: "+
                              ProfileController.to.profile.value!.email.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("BG: ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(ProfileController.to.profile.value!.bloodGroup.toString(),
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(" | DOB: "+
                                    ProfileController.to.profile.value!.dob.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Container(height: 2, width: double.infinity, color: Colors.blue,),
                            SizedBox(height: 10,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                    width: (Get.width - 80)/3,
                                    height: (Get.width - 80)/3,
                                    child: Image.asset("assets/notificationicon.png", height: 80,)),
                                Container(
                                    width: (Get.width - 80)/3,
                                    height: (Get.width - 80)/3,
                                    child: QrImageView(data: "$domain/member-verification/${ProfileController.to.profile.value!.memberId.toString()}")),
                              ],
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                      
                      // SizedBox(height: 20,),
                      // InkWell(
                      //   onTap: (){
                      //     Get.toNamed(AppRoutes.CARDSCAN);
                      //   },
                      //   child: Container(
                      //     width: Get.width - 80,
                      //     height: 60,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(10),
                      //       color: Colors.green,
                      //     ),
                      //     child: Center(
                      //       child: Text(
                      //         "Card Verification",
                      //         style: TextStyle(
                      //           color: Colors.white,
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 20,
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                )
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
