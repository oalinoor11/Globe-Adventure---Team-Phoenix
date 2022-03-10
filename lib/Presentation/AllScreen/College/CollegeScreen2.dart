import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/college_model.dart';
import 'package:BornoBangla/Presentation/Controllers/college_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../Data/Models/country_model.dart';

class CollegeScreen2 extends StatefulWidget {
  @override
  State<CollegeScreen2> createState() => _CollegeScreen2State();
}

class _CollegeScreen2State extends State<CollegeScreen2> {
  CountryModel country = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Study in "+country.countryName,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.toNamed(AppRoutes.ADDCOLLEGESCREEN);
          }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
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
            const SizedBox(height: 18.0),
            StreamBuilder(
              builder: (context, AsyncSnapshot<List<CollegeModel>> snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      CollegeModel college = snapshot.data![index];
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
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image(
                                    image: NetworkImage(college.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(college.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                        onTap: () {
                          //Get.toNamed(AppRoutes.COURSESSCREEN);
                        },
                        onLongPress: () {
                          Get.toNamed(AppRoutes.EDITCOLLEGESCREEN,
                              arguments: college);
                        },
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.85,
                      mainAxisSpacing: 10,
                      crossAxisCount: context.width > 1080 ? 4 : 2,
                    ),
                    // itemCount: (snapshot.data as QuerySnapshot).documents.length,) ,
                    itemCount: snapshot.data?.length ?? 0,
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else {
                  return CircularProgressIndicator();
                }
              },
              stream: CollegeModel.getColleges(
                  CollegeController.to.selectedCountry()),
            ),
          ],
        ),
      ),
    );
  }
}
