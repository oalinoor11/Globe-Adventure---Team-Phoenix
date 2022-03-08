import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/scholarship_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ApplyScholarshipScreen extends StatefulWidget {
  @override
  State<ApplyScholarshipScreen> createState() => _ApplyScholarshipScreenState();
}

class _ApplyScholarshipScreenState extends State<ApplyScholarshipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Scholarship",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.toNamed(AppRoutes.ADDSCHOLARSHIPSCREEN);
          }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            CarouselSlider(
              options: CarouselOptions(
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
                        "assets/scholarshipbanner.png",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            StreamBuilder<List<ScholarshipModel>>(
              stream: ScholarshipModel.getAll(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          ScholarshipModel scholarship = snapshot.data![index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.green, width: 2),
                                  borderRadius: BorderRadiusDirectional.only(
                                      bottomEnd: Radius.circular(18),
                                      bottomStart: Radius.circular(18)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 3,
                                        spreadRadius: 0,
                                        offset: Offset(0, 2))
                                  ]),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    child: YoutubePlayer(
                                      controller: YoutubePlayerController(
                                          initialVideoId: scholarship.videoId),
                                      showVideoProgressIndicator: true,
                                      progressIndicatorColor: Colors.blueAccent,
                                    ),
                                    onLongPress: () {
                                      Get.toNamed(
                                          AppRoutes.EDITSCHOLARSHIPSCREEN,
                                          arguments: scholarship);
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadiusDirectional.only(
                                                      bottomStart:
                                                          Radius.circular(10)),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Text("Application Link",
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                            ),
                                          ),
                                          onTap: () async {
                                            await launch(
                                              scholarship.applicationLink,
                                              forceSafariVC: true,
                                              forceWebView: true,
                                              enableJavaScript: true,
                                            );
                                          },
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadiusDirectional.only(
                                                      bottomEnd:
                                                          Radius.circular(10)),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Text(
                                                  "Apply for Processing",
                                                  softWrap: true,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white)),
                                            ),
                                          ),
                                          onTap: () {
                                            Get.toNamed(
                                                AppRoutes
                                                    .SCHOLARSHIPAPPLYSCREEN,
                                                arguments: scholarship);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (_, index) => SizedBox(
                          height: 10,
                        ),
                        itemCount: snapshot.data!.length,
                      )
                    : CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
