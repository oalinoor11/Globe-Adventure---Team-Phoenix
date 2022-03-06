import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/university_model.dart';
import 'package:BornoBangla/Presentation/Controllers/university.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class UniversityScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          "Study in Selected Country",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.toNamed(AppRoutes.ADDUNIVERSITYSCREEN);
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
            const SizedBox(height: 8.0),
            StreamBuilder<List<UniversityModel>>(
              stream: UniversityModel.getUniversities(
                  UniversityController.to.selectedCountry()),
              builder:
                  ((context, AsyncSnapshot<List<UniversityModel>> snapshot) {
                return snapshot.hasData
                    ? GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (_, index) {
                          UniversityModel universityModel =
                              snapshot.data![index];
                          return InkWell(
                            child: Container(
                              width: 175.0,
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
                                    height: 120,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image(
                                        image:
                                            NetworkImage(universityModel.image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(universityModel.name,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  SizedBox(height: 5),
                                ],
                              ),
                            ),
                            onTap: () {
                              Get.toNamed(AppRoutes.COURSESSCREEN,
                                  arguments: universityModel);
                            },
                            onLongPress: () {
                              Get.toNamed(AppRoutes.EDITCOUNTRYSCREEN);
                            },
                          );
                        },
                      )
                    : snapshot.hasError
                        ? Text(snapshot.error.toString())
                        : Center(child: CircularProgressIndicator());
              }),
            ),
          ],
        ),
      ),
    );
  }
}
