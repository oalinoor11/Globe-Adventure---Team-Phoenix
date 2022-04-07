import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
        centerTitle: true,
        title: Center(
          child: Text(
            "About Us",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            children: [Container(),
              Container(
                width: double.infinity,
                padding: new EdgeInsets.all(8),
                decoration: new BoxDecoration(color: Colors.white),
                child: Container(
                  width: double.infinity,
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.green.withOpacity(0.5)),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.green.withOpacity(0.05),
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
                        child: Column(
                          children: [
                            Text(
                              "Borno Bangla",
                              style: TextStyle(
                                fontSize: 20.0,
                                  color: Colors.green,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text(
                              "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10,),
                            Text(
                              "Licence Number: XXXXXXXXX",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: new EdgeInsets.all(8),
                decoration: new BoxDecoration(color: Colors.white),
                child: Container(
                  width: double.infinity,
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.green.withOpacity(0.5)),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.green.withOpacity(0.05),
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
                        child: Column(
                          children: [
                            Text(
                              "Contact Us",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.apartment),
                                Text(
                                  " address",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.support_agent),
                                Text(
                                  " +8801893465557",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.email),
                                Text(
                                  " mail address",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: new EdgeInsets.all(8),
                decoration: new BoxDecoration(color: Colors.white),
                child: Container(
                  width: double.infinity,
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.green.withOpacity(0.5)),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.green.withOpacity(0.05),
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
                        child: Column(
                          children: [
                            Text(
                              "Privacy Policy",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                color: Colors.red
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.verified_user),
                                TextButton(
                                  onPressed: () async {
                                    await launch(
                                      "https://drive.google.com/file/d/1jUG9DwTT1zTH8oFDI9BncWHa5EfCIyUs/view?usp=sharing",
                                    );
                                  },
                                  child: Text(
                                    "Click Here",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.brown,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                  ),
                                ),
                                Text(
                                  "to see Privacy Policy",
                                  style: TextStyle(
                                      fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                padding: new EdgeInsets.all(8),
                decoration: new BoxDecoration(color: Colors.white),
                child: Container(
                  width: double.infinity,
                  decoration: new BoxDecoration(
                    border: Border.all(color: Colors.green.withOpacity(0.5)),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.green.withOpacity(0.05),
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
                        child: Column(
                          children: [
                            Text(
                              "Terms & Conditions",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal
                              ),
                            ),
                            SizedBox(height: 10,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.gavel),
                                Text(
                                  "Read our",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    await launch(
                                      "https://drive.google.com/file/d/1BAnNHhmwrYWABwOlSXNO3uebgwsYHxuR/view?usp=sharing",
                                    );
                                  },
                                  child: Text(
                                    "Terms & Conditions",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.brown,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 18),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Image(
                image: AssetImage("assets/sslcommerzbanner.png"),
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
