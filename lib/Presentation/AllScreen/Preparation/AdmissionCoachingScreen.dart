import 'dart:math';
import 'package:BornoBangla/Core/AppRoutes.dart';
import 'package:BornoBangla/Data/Models/coaching_model.dart';
import 'package:BornoBangla/Presentation/Controllers/coaching_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AdmissionCoachingScreen extends StatefulWidget {
  @override
  State<AdmissionCoachingScreen> createState() =>
      _AdmissionCoachingScreenState();
}

class _AdmissionCoachingScreenState extends State<AdmissionCoachingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.92),
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title:
            // Image.asset("assets/logo.png", height: 130),
            Center(
              child: Text(
          "${CoachingController.to.selectedType()} Coaching",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
            ),
        automaticallyImplyLeading: false,
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.toNamed(AppRoutes.ADDCOACHINGSCREEN);
          }),
      body: Column(
        children: [
          SizedBox(height: 18),
          Expanded(
            child: StreamBuilder<List<CoachingModel>>(
                stream: CoachingModel.getCoachingList(
                    CoachingController.to.selectedType()),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 18.0),
                        itemCount: snapshot.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.72,
                          crossAxisCount: context.width > 1080 ? 4 : 2,
                        ),
                        itemBuilder: (context, index) {
                          var coaching = snapshot.data![index];
                          return InkWell(
                            child:
                            Container(
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
                                      child:
                                      Container(
                                        child: Image(
                                          image: NetworkImage(coaching.image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(coaching.name,
                                      textAlign: TextAlign.center,
                                      style:
                                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                                  SizedBox(height: 5),
                                  Row(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("rating: ",style: TextStyle(color: Colors.black54, fontSize: 15)),
                                      Icon(Icons.star,color: Colors.black54,size: 15),
                                      Text(
                                        coaching.rating,
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



                                  // Row(
                                  //   children: [
                                  //
                                  //     Icon(Icons.star,color: Colors.white,),
                                  //     Text(
                                  //       coaching.rating,
                                  //       style: Theme.of(context)
                                  //           .textTheme
                                  //           .bodyText1!
                                  //           .copyWith(
                                  //         color: Colors.white,
                                  //         fontWeight: FontWeight.bold,
                                  //         fontSize: 20,
                                  //       ),
                                  //     ),
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                            onTap: () {
                              CoachingController.to.coachingModel(coaching);
                              Get.toNamed(AppRoutes.ADMISSIONCOACHINGSCREEN2,
                                  arguments: coaching);
                            },
                            onLongPress: () {
                              Get.toNamed(AppRoutes.EDITCOACHINGSCREEN,
                                  arguments: coaching);
                            },
                          );
                        });
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}
