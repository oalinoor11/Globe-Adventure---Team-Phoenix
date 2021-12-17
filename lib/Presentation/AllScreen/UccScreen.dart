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
              SizedBox(
                height: 180,
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
                height: 230,
                width: double.infinity,
                padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    boxShadow: [new BoxShadow(
                      color: Colors.grey,
                      blurRadius: 15.0,
                    ),]
                ),
                child: SingleChildScrollView(scrollDirection: Axis.horizontal,
                  child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          color: Colors.lightBlueAccent[700],
                          textColor: Colors.white,
                          child: Container(
                            height: 220.0,
                            width: 250.0,
                            child: Center(
                              child: Text(
                                "Course1",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          onPressed: ()
                          {
                            print("clicked school");
                            Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN);
                          },
                        ),
                        SizedBox(width: 8),
                        RaisedButton(
                          color: Colors.lightBlueAccent[700],
                          textColor: Colors.white,
                          child: Container(
                            height: 220.0,
                            width: 250.0,
                            child: Center(
                              child: Text(
                                "Course2",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          onPressed: ()
                          {
                            print("clicked school");
                            Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN);
                          },
                        ),
                        SizedBox(width: 8),
                        RaisedButton(
                          color: Colors.lightBlueAccent[700],
                          textColor: Colors.white,
                          child: Container(
                            height: 220.0,
                            width: 250.0,
                            child: Center(
                              child: Text(
                                "Course3",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          onPressed: ()
                          {
                            print("clicked school");
                            Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN);
                          },
                        ),
                        SizedBox(width: 8),
                      ]
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
