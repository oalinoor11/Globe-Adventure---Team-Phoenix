import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/country_model.dart';
import 'package:BornoBangla/Data/firebase_collections.dart';
import 'package:BornoBangla/Presentation/Controllers/school_controller_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../Controllers/college_controller.dart';

class SchoolScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
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
        child: Column(
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
                        "assets/scholarshipbanner.png",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 18),
            StreamBuilder(
                builder: (context, AsyncSnapshot<List<CountryModel>> snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      primary: false,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        CountryModel country = snapshot.data![index];
                        return InkWell(
                          child: Container(
                            decoration: new BoxDecoration(
                              border: Border.all(color: Colors.green, width: 1.5),
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
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(13),
                                    child: Image(
                                      image: NetworkImage(country.countryFlag),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(country.countryName,
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 5),
                              ],
                            ),
                          ),
                          onTap: () {
                            SchoolController.to
                                .selectedCountry(country.countryName);
                            Get.toNamed(AppRoutes.SCHOOLSCREEN2);
                          },
                          onLongPress: () {
                            Get.toNamed(AppRoutes.EDITCOUNTRYSCREEN,
                                arguments: country);
                          },
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.8,
                        mainAxisSpacing: 10,
                        crossAxisCount: context.width > 1080 ? 4 : 3,
                      ),
                      // itemCount: (snapshot.data as QuerySnapshot).documents.length,) ,
                      itemCount: snapshot.data?.length ?? 0,
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
                stream: CountryModel.getCountries()),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
