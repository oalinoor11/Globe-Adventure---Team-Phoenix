import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/school_model.dart';
import 'package:BornoBangla/Data/firebase_collections.dart';
import 'package:BornoBangla/Presentation/Controllers/school_controller_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../Core/AppRoutes.dart';
import '../../../Data/Models/country_model.dart';

class SchoolScreen2 extends StatefulWidget {
  @override
  State<SchoolScreen2> createState() => _SchoolScreen2State();
}

class _SchoolScreen2State extends State<SchoolScreen2> {
  CountryModel country = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Center(
          child: Text(
              "Study in " +country.countryName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.toNamed(AppRoutes.ADDSCHOOLSCREEN);
          }),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(),
            Container(
              child: Image(
                image: NetworkImage(country.bannerImages),
              ),
            ),
            const SizedBox(height: 18.0),
            StreamBuilder(
              builder: (context, AsyncSnapshot<List<SchoolModel>> snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    primary: false,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      SchoolModel school = snapshot.data![index];
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
                                    image: NetworkImage(school.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(school.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  )),
                              SizedBox(height: 5),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("rating: ",style: TextStyle(color: Colors.black54, fontSize: 15)),
                                  Icon(Icons.star,color: Colors.black54,size: 15),
                                  Text(
                                    school.rating,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                            ],
                          ),
                        ),
                        onTap: () {
                          //Get.toNamed(AppRoutes.COURSESSCREEN);
                        },
                        onLongPress: () {
                          Get.toNamed(AppRoutes.EDITSCHOOLSCREEN,
                              arguments: school);
                        },
                      );
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.74,
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
              stream:
                  SchoolModel.getSchools(SchoolController.to.selectedCountry()),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
