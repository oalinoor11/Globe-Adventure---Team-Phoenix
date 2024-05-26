import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title:
          Text(
            "ইসলামিক কুইজ অ্যাপস",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              // Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.white),
              onPressed: () {
                // Navigator.pop(context);
              },
            ),

          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 1.5,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 10,
                      blurRadius: 10,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
                ),),
              Image.asset("assets/sadekulquizbanner.png"),
              SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width -60)/2,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blueGrey.withOpacity(0.5), width: 1.5),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/sadekulquizicon.png", height: 35, width: 35, fit: BoxFit.cover,),
                        SizedBox(width: 5,),
                        Text("কুইজ খেলুন", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width -60)/2,
                    decoration: BoxDecoration(
                      color: Colors.brown.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.brown.withOpacity(0.5), width: 1.5),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/sadekullivequizicon.png", height: 35, width: 35, fit: BoxFit.cover,),
                        SizedBox(width: 5,),
                        Text("লাইভ কুইজ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(width: MediaQuery.of(context).size.width -40, height: 80,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red.withOpacity(0.5), width: 1.5),
                ), child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text("GB Avcịmi Oviv ARObK...Z Avịqi 50% UvKv wdwjw itbi gymwjg i mnvqZvi Rb™ vb Kiv niteE", textAlign: TextAlign.center,)),
                ),),
              SizedBox(height: 15,),
              Container(width: MediaQuery.of(context).size.width -40, height: 105,
                decoration: BoxDecoration(
                  // color: Colors.red.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ), child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width -40)/5, height: 80,
                          decoration: BoxDecoration(
                            // color: Colors.green.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black.withOpacity(0.5), width: 1.5),
                          ), child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Image.asset("assets/sadekulqabadirectionicon.png")),
                        ),),
                        SizedBox(height: 4,),
                        Text("কিবলা", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(1)),)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width -40)/5, height: 80,
                          decoration: BoxDecoration(
                            // color: Colors.green.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.green.withOpacity(0.5), width: 1.5),
                          ), child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Image.asset("assets/sadekulprayericon.png")),
                        ),),
                        SizedBox(height: 4,),
                        Text("নামাজ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green.withOpacity(1)),)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width -40)/5, height: 80,
                          decoration: BoxDecoration(
                            // color: Colors.green.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.red.withOpacity(0.5), width: 1.5),
                          ), child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Image.asset("assets/sadekuljanajaicon.png")),
                        ),),
                        SizedBox(height: 4,),
                        Text("জানাজা", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red.withOpacity(1)),)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width -40)/5, height: 80,
                          decoration: BoxDecoration(
                            // color: Colors.green.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue.withOpacity(0.5), width: 1.5),
                          ), child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Image.asset("assets/sadekuleidicon.png")),
                        ),),
                        SizedBox(height: 4,),
                        Text("ঈদ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue.withOpacity(1)),)
                      ],
                    ),
                  ],
                ),),
              SizedBox(height: 15,),
              Container(width: MediaQuery.of(context).size.width -40, height: 105,
                decoration: BoxDecoration(
                  // color: Colors.red.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                ), child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width -40)/5, height: 80,
                          decoration: BoxDecoration(
                            // color: Colors.green.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blue.withOpacity(0.5), width: 1.5),
                          ), child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Image.asset("assets/sadekulhajjicon.png")),
                        ),),
                        SizedBox(height: 4,),
                        Text("হজ্জ্ব", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue.withOpacity(1)),)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width -40)/5, height: 80,
                          decoration: BoxDecoration(
                            // color: Colors.green.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.red.withOpacity(0.5), width: 1.5),
                          ), child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Image.asset("assets/sadekuleidicon.png")),
                        ),),
                        SizedBox(height: 4,),
                        Text("রোজা", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red.withOpacity(1)),)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width -40)/5, height: 80,
                          decoration: BoxDecoration(
                            // color: Colors.green.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.green.withOpacity(0.5), width: 1.5),
                          ), child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Image.asset("assets/sadekulsuraicon.png")),
                        ),),
                        SizedBox(height: 4,),
                        Text("সূরা", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green.withOpacity(1)),)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: (MediaQuery.of(context).size.width -40)/5, height: 80,
                          decoration: BoxDecoration(
                            // color: Colors.green.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black.withOpacity(0.5), width: 1.5),
                          ), child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Image.asset("assets/sadekuljakaticon.png")),
                        ),),
                        SizedBox(height: 4,),
                        Text("জাকাত", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black.withOpacity(1)),)
                      ],
                    ),
                  ],
                ),),
              SizedBox(height: 15,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width -60)/2,
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blue.withOpacity(0.5), width: 1.5),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/sadekulhadisicon.png", height: 35, width: 35, fit: BoxFit.cover,),
                        SizedBox(width: 5,),
                        Text("৪০টি হাদিস", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Container(
                    width: (MediaQuery.of(context).size.width -60)/2,
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green.withOpacity(0.5), width: 1.5),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/sadekulduaicon.png", height: 35, width: 35, fit: BoxFit.cover,),
                        SizedBox(width: 5,),
                        Text("বিশেষ দোয়া", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Container(width: MediaQuery.of(context).size.width -40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black.withOpacity(0.5), width: 1.5),
                ), child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(child: Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/sadekulreviewicon.png", height: 35, width: 35, fit: BoxFit.cover,),
                      SizedBox(width: 5,),
                      Text("অ্যাপস রিভিউ", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    ],
                  )),
                ),),
              SizedBox(height: 15,),
              Container(width: MediaQuery.of(context).size.width -40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  // border: Border.all(color: Colors.red.withOpacity(0.5), width: 1.5),
                  image: DecorationImage(
                    image: AssetImage("assets/sadekulfilistinflag.jpg"),
                    fit: BoxFit.cover,
                  ),
                ), child: Padding(
                  padding: const EdgeInsets.all(11.5),
                  child: Center(child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.6),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 1), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Text("সাপোর্ট ফিলিস্তিন", textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),))),
                ),),
              SizedBox(height: 15,),
            ],
          ),
        )
    );
  }
}
