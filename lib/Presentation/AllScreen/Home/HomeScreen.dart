import 'package:flutter/material.dart';
import '../../../Core/appData.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool logoutLoader = false;

  String checkProfileData = "null";


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          title:
          Text(
            "Globe Adventure",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Center(child: Image.asset("assets/logo.png", fit: BoxFit.cover,)),
    );
  }
}
