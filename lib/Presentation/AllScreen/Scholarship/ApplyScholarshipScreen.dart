import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/scholarship_model.dart';
import 'package:BornoBangla/Presentation/Controllers/scholarship_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ApplyScholarshipScreen extends StatefulWidget {
  @override
  State<ApplyScholarshipScreen> createState() => _ApplyScholarshipScreenState();
}

class _ApplyScholarshipScreenState extends State<ApplyScholarshipScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: context.width > 550 ? BoxDecoration(border: Border.all(width: 2, color: Colors.grey.withOpacity(0.35))): null,
        width: context.width > 550 ? 550 : double.infinity,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            title: Center(
              child: Text(
                "Scholarship",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(),
                CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 1.0,
                    autoPlay: false,
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
                SizedBox(
                  height: 18,
                ),
                StreamBuilder<List<ScholarshipModel>>(
                  stream: ScholarshipModel.getAll(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                            shrinkWrap: true,
                            primary: false,
                            itemBuilder: (context, index) {
                              ScholarshipModel scholarship = snapshot.data![index];
                              return Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.15),
                                    border:
                                        Border.all(color: Colors.green, width: 1.5),
                                    borderRadius: BorderRadiusDirectional.circular(18),
                                    ),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    InkWell(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(19),
                                          topRight: Radius.circular(17),),
                                        child: YoutubePlayerIFrame(
                                          controller: YoutubePlayerController(
                                        params: const YoutubePlayerParams(autoPlay: false),
                                              initialVideoId: scholarship.videoId),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                              scholarship.name,
                                              softWrap: true,
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  color: Colors.black, fontSize: 16)),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          InkWell(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadiusDirectional.circular(4),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(3.0),
                                                child: Text(" Application Link ",
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
                                              );
                                            },
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          InkWell(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadiusDirectional.circular(4),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(6.0),
                                                child: Text(
                                                    " Apply for Processing ",
                                                    softWrap: true,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white, fontSize: 12)),
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
                              );
                            },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.88,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                      ),
                            itemCount: snapshot.data!.length,
                          )
                        : CircularProgressIndicator();
                  },
                ),
                SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
