import 'dart:developer';

import 'package:BornoBangla/Data/Models/coach_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../../Core/AppRoutes.dart';

class CareerCoachScreen2 extends StatefulWidget {
  @override
  State<CareerCoachScreen2> createState() => _CareerCoachScreen2State();
}

class _CareerCoachScreen2State extends State<CareerCoachScreen2> {
  late YoutubePlayerController _controller;

  CoachModel coach = Get.arguments;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: coach.videoId,
      params: const YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
        desktopMode: false,
        privacyEnhanced: true,
        useHybridComposition: true,
        autoPlay: false,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      log('Exited Fullscreen');
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Center(
          child: Text(
            coach.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(),
              SizedBox(height: 6),
              Container(
                width: double.infinity,
                padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                decoration: new BoxDecoration(color: Colors.white),
                child: Container(
                  width: double.infinity,
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: YoutubePlayerIFrame(
                      controller: _controller,
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
                          coach.description,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Counselling Fee:  '+coach.currency.toString(),
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    coach.price.toString(),
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Container(
                height: 50,
                width: 220,
                child: RaisedButton(
                  elevation: 0,
                  color: Colors.green,
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0),
                  ),
                  onPressed: () {
                    Get.toNamed(AppRoutes.BOOKAPPOINTMENTSCREEN,
                        arguments: coach);
                  },
                  child: Center(
                    child: Text(
                      "Request for Appointment",
                      style: TextStyle(
                        fontSize: 16.0,
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
