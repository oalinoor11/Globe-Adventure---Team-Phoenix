import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:durbarclub/Controllers/profile_controller.dart';
import 'package:durbarclub/Core/AppRoutes.dart';
import 'package:durbarclub/Data/firebase_collections.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Core/appData.dart';
import '../../../Data/Models/NotificationModel.dart';

class NotificationScreen extends StatefulWidget {
  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool logoutLoader = false;
  String tappedNotification = "";


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
              // SizedBox(height: 20,),
              // InkWell(
              //   onTap: () {
              //     Share.share("https://play.google.com/store/apps/details?id=app.pronfc.android");
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.only(
              //       left: 10,
              //       right: 40,
              //     ),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Row(
              //           mainAxisAlignment:
              //           MainAxisAlignment.spaceBetween,
              //           children: [
              //             Row(
              //               children: [
              //                 Icon(
              //                   Icons.share,
              //                   size: 25,
              //                   color: primaryColor,
              //                 ),
              //                 Text(
              //                   " Share App",
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.normal,
              //                       fontSize: 16),
              //                 ),
              //               ],
              //             ),
              //             Icon(
              //               Icons.arrow_forward_ios_rounded,
              //               size: 18,
              //               color: Colors.brown,
              //             ),
              //           ],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
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
            "Notification",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: StreamBuilder<List<NotificationModel>>(
              builder: (context, AsyncSnapshot<List<NotificationModel>> snapshot) {
                if (snapshot.hasData) {
                  return (snapshot.data?.length ?? 0) == 0 ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 80,),
                          Image.asset("assets/nomessages.png"),
                          // SizedBox(height: 20,),
                          // Text("No Messages", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                  ) : ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      NotificationModel notification = snapshot.data![index];
                      return InkWell(
                        onTap: () {
                          if(notification.image != ""){
                            setState(() {
                              tappedNotification == index.toString() ? tappedNotification = "" : tappedNotification = index.toString();
                            });
                          }
                        },
                        onLongPress: () {
                          FirebaseFirestore.instance.collection("RULES").doc("a583h4WjRBP7z0j57BVq").get().then((value) {
                            if(value.exists){
                              if(value.data()!["notificationsendPermission"].toString().contains(ProfileController.to.profile.value!.designation.toString())){
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: Colors.white,
                                        title: Text("Delete Notification"),
                                        content: Text("Are you sure you want to delete this notification?"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Cancel"),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              notification.delete();
                                              Get.offAllNamed(AppRoutes.MAINSCREEN);
                                            },
                                            child: Text("Delete", style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                                          ),
                                        ],
                                      );
                                    }
                                );
                              }else{
                                // Get.snackbar("Permission Denied", "You are not an admin");
                              }
                            }else{
                              // Get.snackbar("Permission Denied", "You are not an admin");
                            }
                          });
                        },
                        child: Column(
                          children: [
                            Column(
                              children: [
                                tappedNotification == index.toString() ? Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            notification.title,
                                            maxLines: 1,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              overflow: TextOverflow.clip,
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            notification.description,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          SizedBox(height: 10),
                                          Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Image.network(
                                                  notification.image,
                                                  fit: BoxFit.fill,
                                                ),
                                              )
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ) :
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                              height: 80,
                                              width: 80,
                                              decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: notification.image == "" ? Center(
                                                child: Icon(
                                                  Icons.notifications,
                                                  color: Colors.white,
                                                  size: 40,
                                                ),
                                              ) :
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Image.network(
                                                  notification.image,
                                                  fit: BoxFit.fill,
                                                ),
                                              )
                                          ),
                                          const SizedBox(width: 10),
                                          Container(
                                            height: 80,
                                            width: MediaQuery.of(context).size.width * 0.6,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      // color: Colors.red,
                                                      width: MediaQuery.of(context).size.width * 0.6,
                                                      child: Text(
                                                        notification.title,
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                          overflow: TextOverflow.clip,
                                                        ),
                                                      ),
                                                    ),
                                                    // Text("${(DateTime.fromMillisecondsSinceEpoch(int.parse(notification.timeStamps), isUtc: false).hour) > 12 ? "${((DateTime.fromMillisecondsSinceEpoch(int.parse(notification.timeStamps), isUtc: false).hour)-12).toString().length == 1 ? "0${(DateTime.fromMillisecondsSinceEpoch(int.parse(notification.timeStamps), isUtc: false).hour)-12}" : (DateTime.fromMillisecondsSinceEpoch(int.parse(notification.timeStamps), isUtc: false).hour)-12}" : (DateTime.fromMillisecondsSinceEpoch(int.parse(notification.timeStamps), isUtc: false).hour) == 0 ? "12" : "${(DateTime.fromMillisecondsSinceEpoch(int.parse(notification.timeStamps), isUtc: false).hour.toString().length == 1 ? "0${DateTime.fromMillisecondsSinceEpoch(int.parse(notification.timeStamps), isUtc: false).hour}" : DateTime.fromMillisecondsSinceEpoch(int.parse(notification.timeStamps), isUtc: false).hour)}"}:${DateTime.fromMillisecondsSinceEpoch(int.parse(notification.timeStamps), isUtc: false).minute.toString().length == 1 ? "0${DateTime.fromMillisecondsSinceEpoch(int.parse(notification.timeStamps), isUtc: false).minute}" : DateTime.fromMillisecondsSinceEpoch(int.parse(notification.timeStamps), isUtc: false).minute} ${(DateTime.fromMillisecondsSinceEpoch(int.parse(notification.timeStamps), isUtc: false).hour) >= 12 ? "PM" : "AM", style: TextStyle(color: Colors.grey, )),
                                                  ],
                                                ),
                                                const SizedBox(height: 5),
                                                Text(
                                                  notification.description,
                                                  maxLines: 2,
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ],
                        ),
                      );
                    },
                    // itemCount: (snapshot.data as QuerySnapshot).documents.length,) ,
                    itemCount: (snapshot.data?.length ?? 0) == 0 ? 1 : (snapshot.data?.length ?? 0) > 10 ? 10 : (snapshot.data?.length ?? 0),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
              stream: NotificationModel.getNotification()),
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
