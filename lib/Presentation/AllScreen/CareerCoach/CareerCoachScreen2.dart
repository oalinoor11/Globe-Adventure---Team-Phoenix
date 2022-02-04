import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../Core/AppRoutes.dart';

class CareerCoachScreen2 extends StatefulWidget {

  @override
  State<CareerCoachScreen2> createState() => _CareerCoachScreen2State();
}

class _CareerCoachScreen2State extends State<CareerCoachScreen2> {
  YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'JSRr4oKMuQ8', // id youtube video
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Selected Coach",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [Container(),
              SizedBox(height: 6),
              Container(
                width: double.infinity,
                padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                decoration: new BoxDecoration(color: Colors.white),
                child: Container(
                  width: double.infinity,
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: false,
                      progressIndicatorColor: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                decoration: new BoxDecoration(color: Colors.white),
                child: Container(
                  width: double.infinity,
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.green),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.green.withOpacity(0.1),
                        blurRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          "Everybody knows him Mr. Solaiman Shukhon as a Mutivissional Speaker in Bangladesh. If you are seeing the Youtube Video a day you must be watching his Motivational talk about every topic. He always tries to motivate the people in the video. As a result, He is gaining big achievements in his life as a Motivational speaker. In the content, we are providing to you the most important and valid information about Mr. Solaiman Shukhon. Solaiman Shukhon is a simple gay from his childhood memories. Readers can also learn about his lifestyle, Biography, family, wife, educational background, career, profession, monthly salary from his career, approx net worth of 2022.",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6),
              Container(
                height: 50,
                width: 200,
                child: RaisedButton(
                  elevation: 0,
                  color: Colors.green,
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoutes.BOOKAPPOINTMENTSCREEN);
                  },
                  child: Center(
                    child: Text(
                      "Book Appointment",
                      style: TextStyle(
                        fontSize: 18.0,
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
