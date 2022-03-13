import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatefulWidget {

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.2),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [Container(),
              const SizedBox(height: 40.0),
              Container(
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
                child: Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 20.0),
                    Container(
                      height: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          "assets/shahed.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Shahed Oali Noor", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10.0),
                        Text("oalinoor11@gmail.com", style: TextStyle(fontSize: 12, color: Colors.black87)),
                      ],
                    ),
                    const SizedBox(width: 15.0),
                    Icon(Icons.arrow_forward_ios, color: Colors.grey,),
                  ],
                ),
              ),
              const SizedBox(height: 15.0),
              Container(
                width: double.infinity,
                height: 280.0,
                decoration: new BoxDecoration(
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.white,
                      blurRadius: 0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),

                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.green, width: 1)),
                          labelText: "Your Profession",
                          labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                        ),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      TextField(
                        controller: addressController,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.green,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.green, width: 1)),
                          labelText: "Your Address",
                          labelStyle: TextStyle(fontSize: 16.0, color: Colors.black),
                        ),
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                      const SizedBox(height: 15.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 60, right: 60),
                        child: InkWell(
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
                            child: Center(child: Text("Be a Partner", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),)),
                          ),
                          // onTap: () async {},
                        ),
                      ),

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
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
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
                  onPressed: (){
                    FirebaseAuth.instance.signOut();
                    Get.offAllNamed(AppRoutes.SIGNINSCREEN);
                  },
                  child: Center(
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                          fontSize: 18.0, color: Colors.red, fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
