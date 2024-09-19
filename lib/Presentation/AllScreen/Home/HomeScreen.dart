import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../Core/appData.dart';

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
          backgroundColor: primaryColor,
          centerTitle: true,
          title:
          Text(
            "দুর্বার",
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
            children:[

            ]
          ),
        )
    );
  }
}
