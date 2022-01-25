import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class SchoolScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "School",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.toNamed(AppRoutes.ADDCOUNTRYSCREEN);
          }),
      body: SingleChildScrollView(
        child:
        Column(
          children: [
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
                        "assets/scholarshipbanner.png",fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.fromLTRB(11.0, 0.0, 11.0, 0.0),
              child:
              Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          width: 115.0,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey.withOpacity(0.15),
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15),

                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image(image: AssetImage("assets/CountryFlag/canadaflag.png"),fit: BoxFit.cover,),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("Canada", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                        onTap: (){
                          Get.toNamed(AppRoutes.SCHOOLSCREEN2);
                        },

                        onLongPress: (){
                          Get.toNamed(AppRoutes.EDITCOUNTRYSCREEN);
                        },
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        child: Container(
                          width: 115.0,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey.withOpacity(0.15),
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15),

                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image(image: AssetImage("assets/CountryFlag/australiaflag.png"),fit: BoxFit.cover,),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("Australia", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                        onTap: (){
                          Get.toNamed(AppRoutes.SCHOOLSCREEN2);
                        },

                        onLongPress: (){
                          Get.toNamed(AppRoutes.EDITCOUNTRYSCREEN);
                        },
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        child: Container(
                          width: 115.0,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey.withOpacity(0.15),
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15),

                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image(image: AssetImage("assets/CountryFlag/finlandflag.png"),fit: BoxFit.cover,),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("Finland", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                        onTap: (){
                          Get.toNamed(AppRoutes.SCHOOLSCREEN2);
                        },

                        onLongPress: (){
                          Get.toNamed(AppRoutes.EDITCOUNTRYSCREEN);
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          width: 115.0,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey.withOpacity(0.15),
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15),

                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image(image: AssetImage("assets/CountryFlag/germanyflag.png"),fit: BoxFit.cover,),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("Germany", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                        onTap: (){
                          Get.toNamed(AppRoutes.SCHOOLSCREEN2);
                        },

                        onLongPress: (){
                          Get.toNamed(AppRoutes.EDITCOUNTRYSCREEN);
                        },
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        child: Container(
                          width: 115.0,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey.withOpacity(0.15),
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15),

                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image(image: AssetImage("assets/CountryFlag/indiaflag.png"),fit: BoxFit.cover,),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("India", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                        onTap: (){
                          Get.toNamed(AppRoutes.SCHOOLSCREEN2);
                        },

                        onLongPress: (){
                          Get.toNamed(AppRoutes.EDITCOUNTRYSCREEN);
                        },
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        child: Container(
                          width: 115.0,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey.withOpacity(0.15),
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(15),

                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image(image: AssetImage("assets/CountryFlag/norwayflag.png"),fit: BoxFit.cover,),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text("Norway", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                        onTap: (){
                          Get.toNamed(AppRoutes.SCHOOLSCREEN2);
                        },

                        onLongPress: (){
                          Get.toNamed(AppRoutes.EDITCOUNTRYSCREEN);
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
