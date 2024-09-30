import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:durbarclub/Controllers/profile_controller.dart';
import 'package:durbarclub/Core/AppRoutes.dart';
import 'package:durbarclub/Data/Models/BloodrequestModel.dart';
import 'package:durbarclub/Data/firebase_collections.dart';
import 'package:durbarclub/Presentation/AllScreen/Notification/sendFCMMessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Core/appData.dart';

class BloodScreen extends StatefulWidget {
  @override
  State<BloodScreen> createState() => _BloodScreenState();
}

class _BloodScreenState extends State<BloodScreen> {

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
        floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: Colors.red,
          onPressed: () {
            Get.toNamed(AppRoutes.REQUESTBLOOD);
          },
          child: Icon(
            Icons.bloodtype_rounded, color: Colors.white, size: 45,
          ),
        ),
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
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20, bottom: 80),
            child: StreamBuilder<List<BloodRequestModel>>(
                builder: (context, AsyncSnapshot<List<BloodRequestModel>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        BloodRequestModel bloodRequest = snapshot.data![index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
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
                              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row( mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(100),
                                          border: Border.all(
                                            color: Colors.red,
                                            width: 2,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(bloodRequest.bloodGroup.toString(),
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                            ),
                                          ),
                                        )
                                      ),
                                      SizedBox(width: 20,),
                                      Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Text("Status: ",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              Text(bloodRequest.status.toString() == "Pending" ? "Not managed" : "Blood managed",
                                                style: TextStyle(
                                                  color: bloodRequest.status.toString() == "Pending" ? Colors.red : Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text("Blood Group: "+bloodRequest.bloodGroup.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          SizedBox(height: 0,),
                                          Text("Requirement: ${bloodRequest.bags.toString()} Bag",
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text("Phone: "+bloodRequest.phone.toString(),
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
                                  SizedBox(height: 20,),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          launch("tel:"+bloodRequest.phone.toString());
                                        },
                                        child: Container(height: 50, width: (Get.width -110)/2, decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.blue,
                                        ), child: Center(child: Text("Call", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)),),
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          if(bloodRequest.status.toString() == "Pending"){
                                            return showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return StatefulBuilder(
                                                      builder: (context, setState) {
                                                        return AlertDialog(
                                                          backgroundColor: Colors.white,
                                                          title: Text("Are you sure?"),
                                                          content: Text("আপনি যদি সর্বশেষ রক্তদান ৫৬ দিনের বেশি সময় আগে করে থাকেন এবং শারীরিকভাবে সুস্থ থাকেন তবেই রক্ত দিবেন।"),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              child: Text("Cancel"),
                                                            ),
                                                            TextButton(
                                                              onPressed: () async {
                                                                Get.back();
                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green, content: Text("Thank you for your support.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)));
                                                                bloodRequest.status = "Processing";
                                                                bloodRequest.donnerImage = ProfileController.to.profile.value!.image.toString();
                                                                bloodRequest.donnerPhone = ProfileController.to.profile.value!.phone.toString();
                                                                bloodRequest.donnerId = ProfileController.to.profile.value!.id.toString();
                                                                bloodRequest.donnerName = ProfileController.to.profile.value!.name.toString();
                                                                await bloodRequest.update();
                                                                await bloodRequest.save();
                                                                await sendFCMMessage("রক্ত জোগাড় হয়েছে", "${ProfileController.to.profile.value!.name.toString()} আপনাকে রক্ত দিতে আসছে।", bloodRequest.requestedById.toString());
                                                              },
                                                              child: Text("Confirm"),
                                                            ),
                                                          ],
                                                        );});
                                                });
                                          }
                                          else if(bloodRequest.requestedById.toString() == ProfileController.to.profile.value!.id){
                                            return showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return StatefulBuilder(
                                                      builder: (context, setState) {
                                                        return AlertDialog(
                                                          backgroundColor: Colors.white,
                                                          title: Text("Are you sure?"),
                                                          content: Text("Have you received the blood?"),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              child: Text("No"),
                                                            ),
                                                            TextButton(
                                                              onPressed: () async {
                                                                Get.back();
                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text("Best wishes.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)));
                                                                bloodRequest.status = "Completed";
                                                                await bloodRequest.update();
                                                                await sendFCMMessage("Thank you", "Thank you for your great help", bloodRequest.donnerId.toString());
                                                              },
                                                              child: Text("Yes"),
                                                            ),
                                                          ],
                                                        );});
                                                });
                                          }
                                          else if(bloodRequest.donnerId.toString() == ProfileController.to.profile.value!.id){
                                            return showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return StatefulBuilder(
                                                      builder: (context, setState) {
                                                        return AlertDialog(
                                                          backgroundColor: Colors.white,
                                                          title: Text("Are you sure?"),
                                                          content: Text("Have you donated the blood?"),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              child: Text("No"),
                                                            ),
                                                            TextButton(
                                                              onPressed: () async {
                                                                Get.back();
                                                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red, content: Text("Thank you.", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)));
                                                                bloodRequest.status = "Completed";
                                                                await bloodRequest.update();
                                                              },
                                                              child: Text("Yes"),
                                                            ),
                                                          ],
                                                        );});
                                                });
                                          }
                                        },
                                        child: Container(height: 50, width: (Get.width -110)/2, decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.green,
                                        ), child: Center(child: Text(bloodRequest.status.toString() == "Pending" ? "Donate" : bloodRequest.requestedById.toString() == ProfileController.to.profile.value!.id ? "Complete" : bloodRequest.donnerId.toString() == ProfileController.to.profile.value!.id ? "Complete" : "Managed", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),)),),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20,),
                                  Container(height: 1, color: Colors.grey.withOpacity(0.3),),
                                  SizedBox(height: 10,),
                                  Container(
                                    width: Get.width - 80,
                                    child: Text("Location: "+bloodRequest.location.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: Get.width - 80,
                                    child: Text("Time: "+bloodRequest.time.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: Get.width - 80,
                                    child: Text("Description: "+bloodRequest.description.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                  bloodRequest.status == "Processing" ? Column(
                                    children: [
                                      SizedBox(height: 10,),
                                      Container(height: 1, color: Colors.grey.withOpacity(0.3),),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Text("Donner Information", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.green),),
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Container(
                                        width: Get.width - 80,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                    height: 40,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(100),
                                                      border: Border.all(
                                                        color: Colors.red,
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                        borderRadius: BorderRadius.circular(100),
                                                        child: Image.network(bloodRequest.donnerImage.toString(), height: 100, width: 100, fit: BoxFit.cover,))),
                                                SizedBox(width: 10,),
                                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(bloodRequest.donnerName.toString(),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    Text(bloodRequest.donnerPhone.toString(),
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 10,),
                                                InkWell(
                                                  onTap: (){
                                                    launch("tel:"+bloodRequest.donnerPhone.toString());
                                                  },
                                                    child: Icon(Icons.call, color: Colors.blue, size: 30,)),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ) : SizedBox(),
                                ],
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
                stream: BloodRequestModel.getActiveRequests()),
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
