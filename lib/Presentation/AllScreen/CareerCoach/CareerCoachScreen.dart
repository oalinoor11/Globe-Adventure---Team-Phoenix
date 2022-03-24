import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/coach_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CareerCoachScreen extends StatefulWidget {
  @override
  State<CareerCoachScreen> createState() => _CareerCoachScreenState();
}

class _CareerCoachScreenState extends State<CareerCoachScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Center(
          child: Text(
            "Career Coach",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            await Get.toNamed(AppRoutes.ADDCAREERCOACHSCREEN);
            setState(() {});
          }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1.0,
                autoPlay: false,
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
                        "assets/careercoachbanner.png",
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.fromLTRB(11.0, 0.0, 11.0, 0.0),
              child: StreamBuilder<List<CoachModel>>(
                stream: CoachModel.getAll(),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.75,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder: (context, index) {
                            CoachModel coach = snapshot.data![index];
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
                                          image: NetworkImage(coach.image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(coach.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 5),
                                    Text(coach.title,
                                        textAlign: TextAlign.center),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              ),
                              onTap: () async {
                                await Get.toNamed(AppRoutes.CAREERCOACHSCREEN2,
                                    arguments: coach);
                                setState(() {});
                              },
                              onLongPress: () async {
                                await Get.toNamed(
                                    AppRoutes.EDITCAREERCOACHSCREEN,
                                    arguments: coach);
                                setState(() {});
                              },
                            );
                          },
                          itemCount: snapshot.data!.length,
                        )
                      : CircularProgressIndicator();
                },
              ),
            ),
            SizedBox(height: 14),
          ],
        ),
      ),
    );
  }
}
