import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class JobCoachingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title:
        // Image.asset("assets/logo.png", height: 130),
        Text(
          "Job Coaching",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.fromLTRB(11.0, 0.0, 11.0, 0.0),
            child:
            Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        height: 180.0,
                        width: 180.0,
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
                          child: Image(image: AssetImage("assets/bcsbytglogo.png"),fit: BoxFit.cover,),
                        ),
                      ),
                      onTap: (){
                        Get.toNamed(AppRoutes.BCSBYTGSCREEN);
                      },
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      child: Container(
                        height: 180.0,
                        width: 180.0,
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
                          child: Image(image: AssetImage("assets/bcsbyrslogo.png"),fit: BoxFit.cover,),
                        ),
                      ),
                      onTap: (){
                        Get.toNamed(AppRoutes.BCSBYRSSCREEN);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: Container(
                        height: 180.0,
                        width: 180.0,
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
                          child: Image(image: AssetImage("assets/uttoronlogo.png"),fit: BoxFit.cover,),
                        ),
                      ),
                      onTap: (){
                        Get.toNamed(AppRoutes.UTTORONSCREEN);
                      },
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
