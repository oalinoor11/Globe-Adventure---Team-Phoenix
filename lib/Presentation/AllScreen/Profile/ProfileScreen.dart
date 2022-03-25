// import 'dart:html';

import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Presentation/Controllers/profile_controller.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

import '../../../Data/Models/profile_model.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // ProfileModel profileModel = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.2),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 18,
            right: 18,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(),
                const SizedBox(height: 30.0),
                InkWell(
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.EDITPROFILESCREEN,
                      // arguments: profileModel
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: 130.0,
                    decoration: new BoxDecoration(
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.white,
                          blurRadius: 0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 20.0),
                        Container(
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Obx(
                              () => ProfileController.to
                                          .profile()!
                                          .profilePicture ==
                                      null
                                  ? Image.network(
                                      "https://firebasestorage.googleapis.com/v0/b/bornobangla-48c47.appspot.com/o/samplepropic.png?alt=media&token=cdd47354-ad50-43f3-9c03-752265b83605",
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      ProfileController.to
                                          .profile()!
                                          .profilePicture!,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("${ProfileController.to.profile()!.name}",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 10.0),
                            Text("${ProfileController.to.profile()!.email}",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black87)),
                          ],
                        ),
                        const SizedBox(width: 15.0),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  width: double.infinity,
                  height: 230.0,
                  decoration: new BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.white,
                        blurRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child:
                      // Padding(
                      //   padding: const EdgeInsets.all(20.0),
                      //   child: Column(
                      //     children: [
                      //       const SizedBox(height: 20.0),
                      //       Text("Good Day!", style: TextStyle(fontSize: 25,
                      //           color: Colors.teal,),),
                      //       const SizedBox(height: 25.0),
                      //       Container(
                      //         width: 200,
                      //         height: 50,
                      //         decoration: new BoxDecoration(
                      //           boxShadow: [
                      //             new BoxShadow(
                      //               color: Colors.teal,
                      //               blurRadius: 0,
                      //             ),
                      //           ],
                      //           borderRadius: BorderRadius.circular(8),
                      //
                      //         ),
                      //         child:
                      //         Center(child: Text("ABCDHSEF", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
                      //           color: Colors.white,),),),
                      //       ),
                      //       const SizedBox(height: 8.0),
                      //       Text("Share you partner code with your friend", style: TextStyle(fontSize: 12,
                      //         color: Colors.blue,),),
                      //     ],
                      //   ),
                      // ),
                      Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "assets/partner.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60, right: 60),
                          child: InkWell(
                            onTap: () async {
                              var result = await CoolAlert.show(
                                backgroundColor: Colors.green,
                                confirmBtnColor: Colors.green,
                                confirmBtnText: ("Confirm"),
                                width: 10,
                                context: context,
                                type: CoolAlertType.confirm,
                                onCancelBtnTap: () => Get.back(result: false),
                                onConfirmBtnTap: () => Get.back(result: true),
                              );
                              if (result) {
                                var result = await http.get(
                                  Uri(
                                    scheme: "http",
                                    host: "msg.elitbuzz-bd.com",
                                    path: "/smsapi",
                                    queryParameters: {
                                      "api_key":
                                          "C20081696225eaffaf0075.13009072",
                                      "type": "text",
                                      "contacts": "01798161323",
                                      "senderid": "37935",
                                      "msg":
                                          "প্রিয় Shahed, পার্টনার হওয়ার জন্য আপনার অনুরোধটি গ্রহণ করা হয়েছ।  আপনার পার্টনার কোড: HDBFH",
                                    },
                                  ),
                                );
                                Get.back();
                              }
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: new BoxDecoration(
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.green,
                                    blurRadius: 0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Text(
                                "Be a Partner",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white),
                              )),
                            ),
                            // onTap: () async {},
                          ),
                        ),
                        const SizedBox(height: 15.0),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  width: double.infinity,
                  height: 90.0,
                  decoration: new BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.white,
                        blurRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          height: 50,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "assets/sociallogo/facebook.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: () async {
                          await launch(
                            "http://facebook.com/bornobanglaofficial",
                          );
                        },
                      ),
                      const SizedBox(width: 15.0),
                      InkWell(
                        child: Container(
                          height: 50,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.red, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "assets/sociallogo/youtube.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: () async {
                          await launch(
                            "http://youtube.com/channel/UCEsr4lXaksFUE5xZYkNkuhw",
                          );
                        },
                      ),
                      const SizedBox(width: 15.0),
                      InkWell(
                        child: Container(
                          height: 50,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.green, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "assets/sociallogo/phone.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: () async {
                          await launch(
                            "tel: +8801711957879",
                          );
                        },
                      ),
                      const SizedBox(width: 15.0),
                      InkWell(
                        child: Container(
                          height: 50,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "assets/sociallogo/website.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: () async {
                          await launch(
                            "http://bornobangla.com",
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15.0),
                Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: new BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.white,
                        blurRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Get.offAllNamed(AppRoutes.SIGNINSCREEN);
                    },
                    child: Center(
                      child: Text(
                        "Log Out",
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
