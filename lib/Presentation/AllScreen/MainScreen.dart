import 'package:BornoBangla/Presentation/AllScreen/ApplyScholarshipScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/CareerCoachScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/CoursesScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/PreparationScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/ProfileScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/UniversityScreen.dart';
import 'package:flutter/material.dart';
import 'BookScreen.dart';
import 'JobScreen.dart';
import 'Questions/HomeScreen.dart';
import 'SignInScreen.dart';

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
      bottomNavigationBar: BottomNavigationBar(selectedItemColor: Colors.green,
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
