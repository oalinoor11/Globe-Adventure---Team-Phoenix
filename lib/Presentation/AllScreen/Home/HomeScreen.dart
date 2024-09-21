import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:durbarclub/Controllers/profile_controller.dart';
import 'package:durbarclub/Core/AppRoutes.dart';
import 'package:durbarclub/Data/firebase_collections.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Core/appData.dart';
import '../../../Data/Models/post_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool logoutLoader = false;

  String checkProfileData = "null";


  @override
  void initState() {
    // FirebaseMessaging.instance.subscribeToTopic("dev");
    checkProfile();
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
        body: checkProfileData == "null" ? Center(child: CircularProgressIndicator(color: primaryColor,)) :
        SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [Container(),
              InkWell(
                onTap: (){
                  FirebaseFirestore.instance.collection("RULES").doc("a583h4WjRBP7z0j57BVq").get().then((value) {
                    if(value.exists){
                      if(value.data()!["postPermission"].toString().contains(ProfileController.to.profile.value!.designation.toString())){
                        Get.toNamed(AppRoutes.CREATEPOST);
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(
                              "You are not allowed to post!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                          ),
                        );
                      }
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text(
                            "You are not allowed to post!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                        ),
                      );
                    }
                  });
                },
                child: Container(height: 70, color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40, width: 40,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.5),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.network(ProfileController.to.profile.value!.image.toString(), fit: BoxFit.cover,)),
                            ),
                            SizedBox(width: 10,),
                            Text("What's going on?", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),)
                          ],
                        ),
                        Icon(Icons.photo_library, color: Colors.green, size: 28,)
                      ],
                    ),
                  ),
                ),
              ),
              Container(height: 8, color: Colors.grey[300],),

              StreamBuilder<List<PostModel>>(
                  builder: (context, AsyncSnapshot<List<PostModel>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          PostModel post = snapshot.data![index];
                          return Container(color: Colors.white,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
                                  child: Column(
                                    children: [
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 40, width: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.grey.withOpacity(0.5), width: 0.5),
                                                  borderRadius: BorderRadius.circular(100),
                                                ),
                                                child: ClipRRect(
                                                    borderRadius: BorderRadius.circular(100),
                                                    child: Image.network(post.posterImage, fit: BoxFit.cover,)),
                                              ),
                                              SizedBox(width: 10,),
                                              Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(post.posterName, style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                                                      SizedBox(width: 3,),
                                                      post.posterVerified == "1" ? Icon(Icons.verified, color: primaryColor, size: 15,) : Container(),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text("${DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(int.parse(post.timeStamps), isUtc: false)).inMinutes.toString() == "0" ? "now" : int.parse(DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(int.parse(post.timeStamps), isUtc: false)).inMinutes.toString()) < 60 ? "${DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(int.parse(post.timeStamps), isUtc: false)).inMinutes.toString()} m" : int.parse(DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(int.parse(post.timeStamps), isUtc: false)).inHours.toString()) < 24 ? "${DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(int.parse(post.timeStamps), isUtc: false)).inHours.toString()} h" : "${DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(int.parse(post.timeStamps), isUtc: false)).inDays.toString()} d"} • ", style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14, fontWeight: FontWeight.normal),),
                                                      post.privacy == "Public" ? Icon(Icons.public, color: Colors.black.withOpacity(0.5), size: 15,) : Container(),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              InkWell(
                                                  onTap: (){
                                                    if(post.posterID != ProfileController.to.profile.value!.id){
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(
                                                          backgroundColor: Colors.red,
                                                          content: Text(
                                                            "This feature is not created!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                                                        ),
                                                      );
                                                    }
                                                    else{
                                                      Get.toNamed(AppRoutes.EDITEPOST, arguments: post);
                                                    }
                                                  },
                                                  child: Icon(post.posterID != ProfileController.to.profile.value!.id ? Icons.more_horiz : Icons.edit, color: Colors.black.withOpacity(0.5), size: post.posterID != ProfileController.to.profile.value!.id ? 25 : 20,)),
                                              SizedBox(width: 5,),
                                              // InkWell(
                                              //     onTap: (){
                                              //       ScaffoldMessenger.of(context).showSnackBar(
                                              //         SnackBar(
                                              //           backgroundColor: Colors.red,
                                              //           content: Text(
                                              //             "This feature is not created!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                                              //         ),
                                              //       );
                                              //     },
                                              //     child: Icon(Icons.close, color: Colors.black.withOpacity(0.5), size: 25,)),
                                            ],
                                          ),
                                        ],
                                      ),
                                      post.caption == "" ? SizedBox() : SizedBox(height: 10,),
                                      post.caption == "" ? SizedBox() : Align(
                                        alignment: Alignment.centerLeft,
                                        child: ReadMoreText(
                                          post.caption,
                                          style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
                                          trimLines: 3,
                                          colorClickableText: Colors.grey,
                                          trimMode: TrimMode.Line,
                                          trimCollapsedText: '... See more',
                                          trimExpandedText: '... See less',
                                          moreStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.5)),
                                          lessStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black.withOpacity(0.5)),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                    ],
                                  ),
                                ),
                                post.image == "" ? SizedBox() : Container(width: MediaQuery.of(context).size.width, color: Colors.grey[300], height: 0.3,),
                                post.image == "" ? SizedBox() : Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width - 20,
                                    child: Image.network(post.image, fit: BoxFit.cover,),
                                  ),
                                ),
                                Container(width: MediaQuery.of(context).size.width, color: Colors.grey[300], height: 0.3,), Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            post.reactions.length < 1 ? Container() : Row(
                                              children: [
                                                post.reactions.where((element) => element["reaction"] == "Like").length > 0 ? Padding(
                                                  padding: EdgeInsets.only(right: 1),
                                                  child: Container(
                                                    height: 18, width: 18,
                                                    child: Image.asset("assets/likereacticon.png"),),
                                                ) : Container(),
                                                post.reactions.where((element) => element["reaction"] == "Love").length > 0 ? Padding(
                                                  padding: EdgeInsets.only(right: 1),
                                                  child: Container(
                                                    height: 18, width: 18,
                                                    child: Image.asset("assets/lovereacticon.png"),),
                                                ) : Container(),
                                                post.reactions.where((element) => element["reaction"] == "Haha").length > 0 ? Padding(
                                                  padding: EdgeInsets.only(right: 1),
                                                  child: Container(
                                                    height: 18, width: 18,
                                                    child: Image.asset("assets/hahareacticon.png"),),
                                                ) : Container(),
                                                post.reactions.where((element) => element["reaction"] == "Wow").length > 0 ? Padding(
                                                  padding: EdgeInsets.only(right: 1),
                                                  child: Container(
                                                    height: 18, width: 18,
                                                    child: Image.asset("assets/wowreacticon.png"),),
                                                ) : Container(),
                                                post.reactions.where((element) => element["reaction"] == "Sad").length > 0 ? Padding(
                                                  padding: EdgeInsets.only(right: 1),
                                                  child: Container(
                                                    height: 18, width: 18,
                                                    child: Image.asset("assets/cryreacticon.png"),),
                                                ) : Container(),
                                                post.reactions.where((element) => element["reaction"] == "Angry").length > 0 ? Padding(
                                                  padding: EdgeInsets.only(right: 1),
                                                  child: Container(
                                                    height: 18, width: 18,
                                                    child: Image.asset("assets/angryreacticon.png"),),
                                                ) : Container(),
                                                Text(" ${post.reactions.length}", style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.normal),),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                post.comments.length < 1 ? Container() : InkWell(
                                                    onTap: (){
                                                      Get.toNamed(AppRoutes.COMMENTPAGE, arguments: post);
                                                    },
                                                    child: Text("${post.comments.length} comments", style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.normal),)),
                                                // SizedBox(width: 15,),
                                                // Text("10 shares", style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.normal),),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Container(width: MediaQuery.of(context).size.width - 20, color: Colors.grey[300], height: 0.5,),
                                      SizedBox(height: 10,),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onLongPress: (){
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext context) {
                                                    return AlertDialog(
                                                      backgroundColor: Colors.white,
                                                      contentPadding: EdgeInsets.zero,
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
                                                      content: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          InkWell(
                                                            onTap: (){
                                                              Navigator.pop(context);
                                                            },
                                                            child: InkWell(
                                                              onTap: () async {
                                                                if(post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).length > 0){
                                                                  post.reactions.removeWhere((element) => element["id"] == ProfileController.to.profile.value!.id);
                                                                  await post.update();

                                                                  post.reactions = [
                                                                    {
                                                                      "id": ProfileController.to.profile.value!.id,
                                                                      "name": ProfileController.to.profile.value!.name,
                                                                      "image": ProfileController.to.profile.value!.image,
                                                                      "verified": ProfileController.to.profile.value!.verified,
                                                                      "reaction": "Like",
                                                                    },
                                                                    ...post.reactions
                                                                  ];
                                                                  await post.update();
                                                                  Navigator.pop(context);
                                                                }
                                                                else {post.reactions = [
                                                                  {
                                                                    "id": ProfileController.to.profile.value!.id,
                                                                    "name": ProfileController.to.profile.value!.name,
                                                                    "image": ProfileController.to.profile.value!.image,
                                                                    "verified": ProfileController.to.profile.value!.verified,
                                                                    "reaction": "Like",
                                                                  },
                                                                  ...post.reactions
                                                                ];
                                                                await post.update();
                                                                Navigator.pop(context);
                                                                }
                                                              },
                                                              child: Container(
                                                                  height: 50, width: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                                                                  child: ClipRRect(
                                                                      borderRadius: BorderRadius.circular(100),
                                                                      child: Image.asset("assets/likereacticon.gif", fit: BoxFit.cover,))),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              if(post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).length > 0){
                                                                post.reactions.removeWhere((element) => element["id"] == ProfileController.to.profile.value!.id);
                                                                await post.update();

                                                                post.reactions = [
                                                                  {
                                                                    "id": ProfileController.to.profile.value!.id,
                                                                    "name": ProfileController.to.profile.value!.name,
                                                                    "image": ProfileController.to.profile.value!.image,
                                                                    "verified": ProfileController.to.profile.value!.verified,
                                                                    "reaction": "Love",
                                                                  },
                                                                  ...post.reactions
                                                                ];
                                                                await post.update();
                                                                Navigator.pop(context);
                                                              }
                                                              else {post.reactions = [
                                                                {
                                                                  "id": ProfileController.to.profile.value!.id,
                                                                  "name": ProfileController.to.profile.value!.name,
                                                                  "image": ProfileController.to.profile.value!.image,
                                                                  "verified": ProfileController.to.profile.value!.verified,
                                                                  "reaction": "Love",
                                                                },
                                                                ...post.reactions
                                                              ];
                                                              await post.update();
                                                              Navigator.pop(context);
                                                              }
                                                            },
                                                            child: Container(
                                                                height: 50, width: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                                                                child: ClipRRect(
                                                                    borderRadius: BorderRadius.circular(100),
                                                                    child: Image.asset("assets/lovereacticon.gif", fit: BoxFit.cover,))),
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              if(post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).length > 0){
                                                                post.reactions.removeWhere((element) => element["id"] == ProfileController.to.profile.value!.id);
                                                                await post.update();

                                                                post.reactions = [
                                                                  {
                                                                    "id": ProfileController.to.profile.value!.id,
                                                                    "name": ProfileController.to.profile.value!.name,
                                                                    "image": ProfileController.to.profile.value!.image,
                                                                    "verified": ProfileController.to.profile.value!.verified,
                                                                    "reaction": "Haha",
                                                                  },
                                                                  ...post.reactions
                                                                ];
                                                                await post.update();
                                                                Navigator.pop(context);
                                                              }
                                                              else {post.reactions = [
                                                                {
                                                                  "id": ProfileController.to.profile.value!.id,
                                                                  "name": ProfileController.to.profile.value!.name,
                                                                  "image": ProfileController.to.profile.value!.image,
                                                                  "verified": ProfileController.to.profile.value!.verified,
                                                                  "reaction": "Haha",
                                                                },
                                                                ...post.reactions
                                                              ];
                                                              await post.update();
                                                              Navigator.pop(context);
                                                              }
                                                            },
                                                            child: Container(
                                                                height: 50, width: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                                                                child: ClipRRect(
                                                                    borderRadius: BorderRadius.circular(100),
                                                                    child: Image.asset("assets/hahareacticon.gif", fit: BoxFit.cover,))),
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              if(post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).length > 0){
                                                                post.reactions.removeWhere((element) => element["id"] == ProfileController.to.profile.value!.id);
                                                                await post.update();

                                                                post.reactions = [
                                                                  {
                                                                    "id": ProfileController.to.profile.value!.id,
                                                                    "name": ProfileController.to.profile.value!.name,
                                                                    "image": ProfileController.to.profile.value!.image,
                                                                    "verified": ProfileController.to.profile.value!.verified,
                                                                    "reaction": "Wow",
                                                                  },
                                                                  ...post.reactions
                                                                ];
                                                                await post.update();
                                                                Navigator.pop(context);
                                                              }
                                                              else {post.reactions = [
                                                                {
                                                                  "id": ProfileController.to.profile.value!.id,
                                                                  "name": ProfileController.to.profile.value!.name,
                                                                  "image": ProfileController.to.profile.value!.image,
                                                                  "verified": ProfileController.to.profile.value!.verified,
                                                                  "reaction": "Wow",
                                                                },
                                                                ...post.reactions
                                                              ];
                                                              await post.update();
                                                              Navigator.pop(context);
                                                              }
                                                            },
                                                            child: Container(
                                                                height: 50, width: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                                                                child: ClipRRect(
                                                                    borderRadius: BorderRadius.circular(100),
                                                                    child: Image.asset("assets/wowreacticon.gif", fit: BoxFit.cover,))),
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              if(post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).length > 0){
                                                                post.reactions.removeWhere((element) => element["id"] == ProfileController.to.profile.value!.id);
                                                                await post.update();

                                                                post.reactions = [
                                                                  {
                                                                    "id": ProfileController.to.profile.value!.id,
                                                                    "name": ProfileController.to.profile.value!.name,
                                                                    "image": ProfileController.to.profile.value!.image,
                                                                    "verified": ProfileController.to.profile.value!.verified,
                                                                    "reaction": "Sad",
                                                                  },
                                                                  ...post.reactions
                                                                ];
                                                                await post.update();
                                                                Navigator.pop(context);
                                                              }
                                                              else {post.reactions = [
                                                                {
                                                                  "id": ProfileController.to.profile.value!.id,
                                                                  "name": ProfileController.to.profile.value!.name,
                                                                  "image": ProfileController.to.profile.value!.image,
                                                                  "verified": ProfileController.to.profile.value!.verified,
                                                                  "reaction": "Sad",
                                                                },
                                                                ...post.reactions
                                                              ];
                                                              await post.update();
                                                              Navigator.pop(context);
                                                              }
                                                            },
                                                            child: Container(
                                                                height: 50, width: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                                                                child: ClipRRect(
                                                                    borderRadius: BorderRadius.circular(100),
                                                                    child: Image.asset("assets/cryreacticon.gif", fit: BoxFit.cover,))),
                                                          ),
                                                          InkWell(
                                                            onTap: () async {
                                                              if(post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).length > 0){
                                                                post.reactions.removeWhere((element) => element["id"] == ProfileController.to.profile.value!.id);
                                                                await post.update();

                                                                post.reactions = [
                                                                  {
                                                                    "id": ProfileController.to.profile.value!.id,
                                                                    "name": ProfileController.to.profile.value!.name,
                                                                    "image": ProfileController.to.profile.value!.image,
                                                                    "verified": ProfileController.to.profile.value!.verified,
                                                                    "reaction": "Angry",
                                                                  },
                                                                  ...post.reactions
                                                                ];
                                                                await post.update();
                                                                Navigator.pop(context);
                                                              }
                                                              else {post.reactions = [
                                                                {
                                                                  "id": ProfileController.to.profile.value!.id,
                                                                  "name": ProfileController.to.profile.value!.name,
                                                                  "image": ProfileController.to.profile.value!.image,
                                                                  "verified": ProfileController.to.profile.value!.verified,
                                                                  "reaction": "Angry",
                                                                },
                                                                ...post.reactions
                                                              ];
                                                              await post.update();
                                                              Navigator.pop(context);
                                                              }
                                                            },
                                                            child: Container(
                                                                height: 50, width: 50, decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
                                                                child: ClipRRect(
                                                                    borderRadius: BorderRadius.circular(100),
                                                                    child: Image.asset("assets/angryreacticon.gif", fit: BoxFit.cover,))),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            onTap: () async {
                                              if(post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).length > 0){
                                                post.reactions.removeWhere((element) => element["id"] == ProfileController.to.profile.value!.id);
                                                await post.update();
                                              }
                                              else {
                                                post.reactions = [
                                                  {
                                                    "id": ProfileController.to.profile.value!.id,
                                                    "name": ProfileController.to.profile.value!.name,
                                                    "image": ProfileController.to.profile.value!.image,
                                                    "verified": ProfileController.to.profile.value!.verified,
                                                    "reaction": "Like",
                                                  },
                                                  ...post.reactions
                                                ];
                                                await post.update();}
                                            },
                                            child: post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).length > 0 ? Row(
                                              children: [
                                                Image.asset(post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).toList().first["reaction"] == "Like" ? "assets/likereacticon.png" : post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).toList().first["reaction"] == "Love" ? "assets/lovereacticon.png" : post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).toList().first["reaction"] == "Haha" ? "assets/hahareacticon.png" : post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).toList().first["reaction"] == "Wow" ? "assets/wowreacticon.png" : post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).toList().first["reaction"] == "Sad" ? "assets/cryreacticon.png" : post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).toList().first["reaction"] == "Angry" ? "assets/angryreacticon.png" : "assets/logo.png", height: 20, width: 20,),
                                                Text(" ${post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).toList().first["reaction"]}", style: TextStyle(color: post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).toList().first["reaction"] == "Like" ? primaryColor : post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).toList().first["reaction"] == "Love" ? Colors.red : post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).toList().first["reaction"] == "Haha" ? Colors.amber : post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).toList().first["reaction"] == "Wow" ? Colors.amber : post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).toList().first["reaction"] == "Sad" ? Colors.amber : post.reactions.where((element) => element["id"] == ProfileController.to.profile.value!.id).toList().first["reaction"] == "Angry" ? Colors.deepOrange : Colors.black.withOpacity(0.5), fontSize: 16, fontWeight: FontWeight.bold),),
                                              ],
                                            ) : Row(
                                              children: [
                                                Icon(Icons.thumb_up_alt_outlined, color: Colors.black.withOpacity(0.5), size: 20,),
                                                Text(" Like", style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 16, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              Get.toNamed(AppRoutes.COMMENTPAGE, arguments: post);
                                            },
                                            child: Row(
                                              children: [
                                                Icon(Icons.chat_bubble_outline, color: Colors.black.withOpacity(0.5), size: 20,),
                                                Text(" Comment", style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 16, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: (){
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  backgroundColor: Colors.red,
                                                  content: Text(
                                                    "This feature is not created!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                                                ),
                                              );
                                            },
                                            child: Row(
                                              children: [
                                                Icon(Icons.share, color: Colors.black.withOpacity(0.5), size: 20,),
                                                Text(" Share", style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 16, fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(height: 8, color: Colors.grey[300],),
                              ],
                            ),
                          );
                        },
                        itemCount: snapshot.data?.length ?? 0,
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                  stream: PostModel.getPosts()),
            ],
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

  checkProfile() async {
    await ProfileController.to.profile();
    if(ProfileController.to.profile.value == null){
      await Future.delayed(Duration(seconds: 1));
      checkProfile();
    }else{
      setState(() {
        checkProfileData = "done";
      });
    }
  }
}
