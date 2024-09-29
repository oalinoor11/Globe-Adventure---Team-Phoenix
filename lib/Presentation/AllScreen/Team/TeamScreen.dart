import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:durbarclub/Controllers/profile_controller.dart';
import 'package:durbarclub/Core/AppRoutes.dart';
import 'package:durbarclub/Data/Models/profile_model.dart';
import 'package:durbarclub/Data/firebase_collections.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Core/appData.dart';

class TeamScreen extends StatefulWidget {
  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool logoutLoader = false;

  DateFormat dateFormat = DateFormat("MMMM d, yyyy");


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
            onLongPress: (){
              FirebaseFirestore.instance.collection("RULES").doc("a583h4WjRBP7z0j57BVq").get().then((value) {
                if(value.exists){
                  if(value.data()!["useronboardingPermission"].toString().contains(ProfileController.to.profile.value!.designation.toString())){
                    Get.toNamed(AppRoutes.PENDINGUSERS);
                  }else{
                    // Get.snackbar("Permission Denied", "You are not an admin");
                  }
                }else{
                  // Get.snackbar("Permission Denied", "You are not an admin");
                }
              });
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
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
            child: StreamBuilder<List<ProfileModel>>(
                builder: (context, AsyncSnapshot<List<ProfileModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        ProfileModel profileModel = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: InkWell(
                            onTap: () {
                              launchUrl(Uri.parse("tel:${profileModel.phone}"), mode: LaunchMode.externalNonBrowserApplication);
                            },
                            onLongPress: (){
                              FirebaseFirestore.instance.collection("RULES").doc("a583h4WjRBP7z0j57BVq").get().then((value) {
                                if(value.exists){
                                  if(value.data()!["useronboardingPermission"].toString().contains(ProfileController.to.profile.value!.designation.toString())){
                                    Get.toNamed(AppRoutes.REJECTUSER, arguments: profileModel.id.toString());
                                  }else{
                                    // Get.snackbar("Permission Denied", "You are not an admin");
                                  }
                                }else{
                                  // Get.snackbar("Permission Denied", "You are not an admin");
                                }
                              });
                            },
                            child: Container(
                              width: Get.width - 40,
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
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row( mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
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
                                                          child: Image.network(profileModel.image.toString())),
                                                    ),
                                                    profileModel.verified.toString() == "true" ? Positioned(
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
                                            SizedBox(width: 10,),
                                            Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(profileModel.name.toString(),
                                                // Text("${dateFormat.format(DateTime.fromMicrosecondsSinceEpoch((int.parse(profileModel.signedUp.toString()))*1000))}",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                SizedBox(height: 0,),
                                                Text(profileModel.designation.toString(),
                                                // Text("${dateFormat.format(DateTime.fromMicrosecondsSinceEpoch((int.parse(profileModel.validity.toString()))*1000))}",
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                                SizedBox(height: 5,),
                                                Row(mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text("Blood Group: ",
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    Text(profileModel.bloodGroup.toString(),
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(profileModel.phone.toString(),
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Icon(Icons.call, color: primaryColor, size: 30,),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: snapshot.data?.length ?? 0,
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
                stream: ProfileModel.getActiveUsers()),
          ),
        ),
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
