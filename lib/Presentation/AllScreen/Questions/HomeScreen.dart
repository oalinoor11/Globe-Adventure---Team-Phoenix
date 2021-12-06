import 'package:flutter/material.dart';
//import 'package:carousel_pro/carousel_pro.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Borno Bangla",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 180,
              width: double.infinity,
              child:
                Image.asset("assets/banner1.png", fit: BoxFit.cover),
              // Carousel(
              //   autoplayDuration: Duration(seconds: 1),
              //   animationDuration: Duration(milliseconds: 500),
              //   dotBgColor: Colors.transparent,
              //   dotSize: 4.0,
              //   dotSpacing: 15.0,
              //   images: [
              //     Image.asset(
              //       "assets/banner1.png",
              //       fit: BoxFit.cover,
              //     ),
              //     Image.asset(
              //       "assets/banner1.png",
              //       fit: BoxFit.cover,
              //     ),
              //     Image.asset(
              //       "assets/banner1.png",
              //       fit: BoxFit.cover,
              //     ),
              //     Image.asset(
              //       "assets/banner1.png",
              //       fit: BoxFit.cover,
              //     ),
              //   ],
              // ),
            ),

            SizedBox(height: 2),

            Container(
              height: 160,
              width: double.infinity,
              padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  boxShadow: [new BoxShadow(
                    color: Colors.grey,
                    blurRadius: 15.0,
                  ),]
              ),
              child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      color: Colors.lightBlueAccent[700],
                      textColor: Colors.white,
                      child: Container(
                        height: 150.0,
                        width: 90.0,
                        child: Center(
                          child: Text(
                            "A",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: ()
                      {
                        print("clicked");

                      },
                    ),
                    SizedBox(width: 8),
                    RaisedButton(
                      color: Colors.lightBlueAccent[700],
                      textColor: Colors.white,
                      child: Container(
                        height: 150.0,
                        width: 90.0,
                        child: Center(
                          child: Text(
                            "B",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: ()
                      {
                        print("clicked");

                      },
                    ),
                    SizedBox(width: 8),
                    RaisedButton(
                      color: Colors.lightBlueAccent[700],
                      textColor: Colors.white,
                      child: Container(
                        height: 150.0,
                        width: 90.0,
                        child: Center(
                          child: Text(
                            "C",
                            style: TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      onPressed: ()
                      {
                        print("clicked");

                      },
                    ),
                  ]
              ),
            ),

          ],
        ),
      ),
    );
  }
}
