import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import 'FirebaseCollections.dart';

class AdmissionCoachingScreen2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Coaching Name",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),

            CarouselSlider(
              options: CarouselOptions(
                height: 120.0,
                viewportFraction: 1.0,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
              ),
              items: [1].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      child: Image.asset(
                        "assets/uccbanner.png",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),

            SizedBox(height: 20),

            // Expanded(
            //   child: StreamBuilder<QuerySnapshot>(
            //       stream: FirebaseCollections.ADMISSIONCOACHING.snapshots(),
            //       builder: (context, snapshot) {
            //         if (snapshot.hasData) {
            //           var coachingList = snapshot.data!.docs;
            //           return GridView.builder(
            //               padding: EdgeInsets.symmetric(horizontal: 8.0),
            //               itemCount: coachingList.length,
            //               gridDelegate:
            //               SliverGridDelegateWithFixedCrossAxisCount(
            //                 crossAxisSpacing: 8,
            //                 mainAxisSpacing: 8,
            //                 childAspectRatio: 1 / 1,
            //                 crossAxisCount: context.width > 1080 ? 4 : 2,
            //               ),
            //               itemBuilder: (context, index) {
            //                 var coaching = coachingList[index].data() as Map<String, dynamic>;
            //                 return InkWell(
            //                   child: Container(
            //                     decoration: new BoxDecoration(
            //                       borderRadius: BorderRadius.circular(15),
            //                       border: Border.all(
            //                           color: Colors.green, width: 1.5),
            //                       image: DecorationImage(
            //                           image:
            //                           // NetworkImage(coaching['image'])
            //                           NetworkImage(coaching['image'])
            //                       ),
            //                       // boxShadow: [
            //                       //   new BoxShadow(
            //                       //     color: Colors.black.withOpacity(1),
            //                       //     blurRadius: 5.0,
            //                       //   ),
            //                       // ],
            //                     ),
            //                     child: Stack(children: [
            //                       Positioned(
            //                           left: 0,
            //                           right: 0,
            //                           bottom: 0,
            //                           child: Container(
            //                               decoration: BoxDecoration(
            //                                 borderRadius: BorderRadius.only(
            //                                   bottomLeft: Radius.circular(13),
            //                                   bottomRight: Radius.circular(13),
            //                                 ),
            //                                 color:
            //                                 Colors.green.withOpacity(0.93),
            //                               ),
            //                               child: Center(
            //                                   child: Padding(
            //                                     padding: const EdgeInsets.all(7.0),
            //                                     child: Text(
            //                                       coaching['title'],
            //                                       style: Theme.of(context)
            //                                           .textTheme
            //                                           .bodyText1!
            //                                           .copyWith(
            //                                         color: Colors.white,
            //                                         fontWeight: FontWeight.bold,
            //                                         fontSize: 20,
            //                                       ),
            //                                     ),
            //                                   )))),
            //                     ]),
            //                   ),
            //                   onTap: () {
            //                     Get.toNamed(AppRoutes.COACHINGAPPLYSCREEN);
            //                   },
            //                 );
            //               });
            //         } else {
            //           return const Center(child: CircularProgressIndicator());
            //         }
            //       }),
            // ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
