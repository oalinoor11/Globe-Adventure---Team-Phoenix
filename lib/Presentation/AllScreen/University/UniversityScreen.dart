import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/university_model.dart';
import 'package:BornoBangla/Presentation/Controllers/scholarship_controller.dart';
import 'package:BornoBangla/Presentation/Controllers/university.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../../Data/Models/country_model.dart';


class UniversityScreen extends StatefulWidget {
  @override
  State<UniversityScreen> createState() => _UniversityScreenState();
}

class _UniversityScreenState extends State<UniversityScreen> {
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
            "Study in "+country.countryName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
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
            StreamBuilder<List<UniversityModel>>(
              stream: UniversityModel.getUniversities(
                  UniversityController.to.selectedCountry()),
              builder:
                  ((context, AsyncSnapshot<List<UniversityModel>> snapshot) {
                return snapshot.hasData
                    ? GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.76,
                          mainAxisSpacing: 10,
                          crossAxisCount: context.width > 1080 ? 4 : 2,
                        ),
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
                                        image:
                                            NetworkImage(universityModel.image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(universityModel.name,
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
                                        universityModel.rating,
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
                              ScholarshipController.to
                                  .university(universityModel);
                              Get.toNamed(AppRoutes.COURSESSCREEN,
                                  arguments: universityModel);
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
