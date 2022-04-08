import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
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
                            ReadMoreText(
                              "Welcome to BORNO Bangla. The country's first and number one market place for education. You have BORNO Bangla by your side with the conviction of fulfilling the dreams of millions of youth. Where are you Coaching Center, Study abroad, Scholarship, Career Coach, Job, Tutor And you will get information and reviews of preparatory books. Even admission can be. We don't do any coaching ourselves or we don't have any schools, colleges or universities of our own. The ad department of the educational institution or their designated person or authorized agent is directly involved with our app. They are constantly monitoring our activities and providing the latest information to make our app more acceptable. In addition, there is a neutral rating of each educational institution based on the reviews given by the students and our observations. We believe that this will help you in the selection of educational institutions and also in increasing the quality of services of educational institutions.",
                              style: TextStyle(color: Colors.black),
                              textAlign: TextAlign.center,
                              trimLines: 8,
                              colorClickableText: Colors.green,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'show less',
                            ),
                            SizedBox(height: 10,),
                            Divider(
                              color: const Color(0xFF167F67),
                            ),
                            Text(
                              "Licence Number: 279197/Dhaka North",
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
                                  " 103/1, Green Road, Farmgate,",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            Text(
                              "Dhaka-1215.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18),
                            ),
                            SizedBox(height: 10,),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.support_agent),
                                Text(
                                  " +8801894844464",
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
                                  " thebornogroup@gmail.com",
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
