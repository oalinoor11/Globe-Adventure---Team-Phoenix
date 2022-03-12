import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class ProfileScreen extends StatelessWidget {

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
                child: Column(
                  children: [
                    Text(
                      "vjnfx",
                      style: TextStyle(
                          fontSize: 16.0, color: Colors.red, fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
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
                    children: [
                      Text(
                        "Log Out",
                        style: TextStyle(
                            fontSize: 16.0, color: Colors.red, fontWeight: FontWeight.bold
                        ),
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
                          fontSize: 16.0, color: Colors.red, fontWeight: FontWeight.bold
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
