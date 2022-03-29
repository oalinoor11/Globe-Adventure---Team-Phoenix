import 'package:BornoBangla/Data/Models/profile_model.dart';
import 'package:BornoBangla/Presentation/AllScreen/Profile/ProfileScreen.dart';
import 'package:BornoBangla/Presentation/Controllers/coaching_controller.dart';
import 'package:BornoBangla/Presentation/Controllers/college_controller.dart';
import 'package:BornoBangla/Presentation/Controllers/profile_controller.dart';
import 'package:BornoBangla/Presentation/Controllers/scholarship_controller.dart';
import 'package:BornoBangla/Presentation/Controllers/school_controller_controller.dart';
import 'package:BornoBangla/Presentation/Controllers/university.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Home/HomeScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.green,
        onTap: (index) {
          pageController.jumpToPage(index);
          setState(() {
            currentIndex = index;
          });
          // pageController.animateToPage(index, duration: Duration(seconds: 0), curve: Curves.ease);
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [
          HomeScreen(),
          ProfileScreen(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
