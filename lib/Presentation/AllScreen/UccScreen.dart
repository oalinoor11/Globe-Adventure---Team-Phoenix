import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class UccScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "UCC",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),

              SizedBox(
                height: 130,
                width: double.infinity,
                child:
                Image.asset("assets/uccbanner.png", fit: BoxFit.cover),
                // Carousel(
                //   autoplayDuration: Duration(seconds: 1),
                //   animationDuration: Duration(milliseconds: 500),
                //   dotBgColor: Colors.transparent,
                //   dotSize: 4.0,
                //   dotSpacing: 15.0,
                //   images: [
                //     Image.asset(
                //       "assets/uccbanner.png",
                //       fit: BoxFit.cover,
                //     ),
                //     Image.asset(
                //       "assets/uccbanner.png",
                //       fit: BoxFit.cover,
                //     ),
                //     Image.asset(
                //       "assets/uccbanner.png",
                //       fit: BoxFit.cover,
                //     ),
                //     Image.asset(
                //       "assets/uccbanner.png",
                //       fit: BoxFit.cover,
                //     ),
                //   ],
                // ),
              ),

              SizedBox(height: 20),

              Container(
                height: 328,
                width: double.infinity,
                padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                decoration: new BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Container(
                              height: 150.0,
                              width: 187.0,
                              decoration: new BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.grey.withOpacity(0.25),
                                    blurRadius: 5.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),

                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(image: AssetImage("assets/ucc_aunit.png"),fit: BoxFit.cover,),
                              ),
                            ),
                            onTap: (){
                              Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN);
                            },
                          ),
                          SizedBox(width: 8),
                          InkWell(
                            child: Container(
                              height: 150.0,
                              width: 187.0,
                              decoration: new BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.grey.withOpacity(0.25),
                                    blurRadius: 5.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),

                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(image: AssetImage("assets/ucc_bunit.png"),fit: BoxFit.cover,),
                              ),
                            ),
                            onTap: (){
                              Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN);
                            },
                          ),
                        ]),
                    SizedBox(height: 8),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Container(
                              height: 150.0,
                              width: 187.0,
                              decoration: new BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.grey.withOpacity(0.25),
                                    blurRadius: 5.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),

                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(image: AssetImage("assets/ucc_cunit.png"),fit: BoxFit.cover,),
                              ),
                            ),
                            onTap: (){
                              Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN);
                            },
                          ),
                          SizedBox(width: 8),
                          InkWell(
                            child: Container(
                              height: 150.0,
                              width: 187.0,
                              decoration: new BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.grey.withOpacity(0.25),
                                    blurRadius: 5.0,
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(15),

                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image(image: AssetImage("assets/ucc_dunit.png"),fit: BoxFit.cover,),
                              ),
                            ),
                            onTap: (){
                              Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN);
                            },
                          ),
                        ]),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
