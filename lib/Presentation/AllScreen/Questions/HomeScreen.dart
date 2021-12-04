import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Borno Bangla",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [Container(),
                //const SizedBox(height: 100.0),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: const Image(
                      image: AssetImage("assets/banner1.png"),
                      alignment: Alignment.center,
                      height: 180,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [Container(),
                          RaisedButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Container(
                              height: 120.0,
                              width: 120,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.apartment,
                                    color: Colors.white,
                                    size: 40.0,
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                      "University",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(24.0),
                            ),
                            onPressed: ()
                            {
                              print("clicked university");
                            },
                          ),

                          const SizedBox(width: 10.0),
                          RaisedButton(
                            color: Colors.green,
                            textColor: Colors.white,
                            child: Container(
                              height: 120.0,
                              width: 120,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.school,
                                    color: Colors.white,
                                    size: 40.0,
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    "Courses",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(24.0),
                            ),
                            onPressed: ()
                            {
                              print("clicked courses");
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 10.0),

                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [Container(),
                          RaisedButton(
                            color: Colors.green,
                            textColor: Colors.white,
                            child: Container(
                              height: 120.0,
                              width: 120,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.summarize,
                                    color: Colors.white,
                                    size: 40.0,
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    "Preparation",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(24.0),
                            ),
                            onPressed: ()
                            {
                              print("clicked preparation");
                            },
                          ),

                          const SizedBox(width: 10.0),
                          RaisedButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            child: Container(
                              height: 120.0,
                              width: 120,
                              child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.psychology,
                                    color: Colors.white,
                                    size: 40.0,
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    "CareerCoach",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(24.0),
                            ),
                            onPressed: ()
                            {
                              print("clicked careercoach");
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30.0),

                const Image(
                  image: AssetImage("assets/coppedlogo.png"),
                  alignment: Alignment.center,
                  height: 80,
                ),
          ],
          ),
        ),
      ),
    );
  }
}
