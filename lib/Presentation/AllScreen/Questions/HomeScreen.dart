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
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [Container(),
              //const SizedBox(height: 100.0),
              const Image(
                image: AssetImage("assets/banner.png"),
                width: 300,
                height: 300,
                alignment: Alignment.center,
              ),



              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [Container(),
                        RaisedButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          child: Container(
                            height: 120.0,
                            width: 120,
                            child: Center(
                              child: Text(
                                "না",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(24.0),
                          ),
                          onPressed: ()
                          {
                            print("clicked No");
                          },
                        ),

                        const SizedBox(width: 10.0),
                        RaisedButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Container(
                            height: 120.0,
                            width: 120,
                            child: Center(
                              child: Text(
                                "না",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(24.0),
                          ),
                          onPressed: ()
                          {
                            print("clicked No");
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
                            child: Center(
                              child: Text(
                                "না",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(24.0),
                          ),
                          onPressed: ()
                          {
                            print("clicked No");
                          },
                        ),

                        const SizedBox(width: 10.0),
                        RaisedButton(
                          color: Colors.red,
                          textColor: Colors.white,
                          child: Container(
                            height: 120.0,
                            width: 120,
                            child: Center(
                              child: Text(
                                "না",
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(24.0),
                          ),
                          onPressed: ()
                          {
                            print("clicked No");
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
        ],
        ),
      ),
    );
  }
}
