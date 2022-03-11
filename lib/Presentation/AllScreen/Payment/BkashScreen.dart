import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';

class BkashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
        centerTitle: true,
        title: Center(
          child: Text(
            "Payment",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [Container(),
              const SizedBox(height: 20.0),
              Container(
                height: 500.0,
                width: 350.0,
                decoration: new BoxDecoration(
                  color: Colors.pink,
                  border: Border.all(color: Colors.pink),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 30.0),
                    Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image(image: AssetImage("assets/bkash_payment_logo.png"),fit: BoxFit.cover,),
                        )),
                    SizedBox(height: 30.0),
                    Container(
                      height: 165.0,
                      width: 300.0,
                      decoration: new BoxDecoration(
                        color: Colors.pink,
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 3,
                            blurRadius: 10,
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 15.0),
                          Text("1. Go to bKash App", style: TextStyle(color: Colors.white, fontSize: 14)),
                          SizedBox(height: 3.0),
                          Text("2. Select 'Payment' option", style: TextStyle(color: Colors.white, fontSize: 14)),
                          SizedBox(height: 3.0),
                          Text("3. Enter number: 01511312412", style: TextStyle(color: Colors.white, fontSize: 14)),
                          SizedBox(height: 3.0),
                          Text("4. Enter course fees amount", style: TextStyle(color: Colors.white, fontSize: 14)),
                          SizedBox(height: 3.0),
                          Text("5. Enter Reference: 'Your Name'", style: TextStyle(color: Colors.white, fontSize: 14)),
                          SizedBox(height: 3.0),
                          Text("6. Enter counter No: 1", style: TextStyle(color: Colors.white, fontSize: 14)),
                          SizedBox(height: 3.0),
                          Text("7. Enter pin to confirm payment", style: TextStyle(color: Colors.white, fontSize: 14)),
                          SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Text("Enter Transaction ID", style: TextStyle(color: Colors.white, fontSize: 18)),
                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 0.0),
                      child:
                      Container(
                        height: 40.0,
                        width: 200.0,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:
                        Column(
                          children: [
                            SizedBox(height: 9.0),
                            TextField(
                              textAlign: TextAlign.center,
                              cursorColor: Colors.pink,
                              decoration:
                              InputDecoration.collapsed(
                                hintText: 'e.g 8XHE39433J',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    InkWell(
                      child: Container(
                        height: 40.0,
                        width: 80.0,
                        decoration: new BoxDecoration(
                          color: Colors.black.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child:
                        Center(child: Text("CONFIRM", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold))),
                      ),
                      onTap: () {
                        Get.snackbar(
                          "Thank You",
                          "Application Submitted",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                        Get.offAllNamed(AppRoutes.MAINSCREEN);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
