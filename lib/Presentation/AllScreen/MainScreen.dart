import 'package:durbarclub/Core/appData.dart';
import 'package:durbarclub/Presentation/AllScreen/Blood/BloodScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../Controllers/profile_controller.dart';
import '../../Core/AppRoutes.dart';
import 'Home/HomeScreen.dart';
import 'Profile/CardScreen.dart';
import 'Team/TeamScreen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController pageController = PageController();
  int currentIndex = 0;

  @override
  void initState() {
    checkPayment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: primaryColor,
        selectedItemColor: Colors.white,
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
            icon: Icon(Icons.rss_feed),
            label: "Feed",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.bloodtype),
            label: "Blood",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: "Team",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.card_membership),
            label: "Card",
          ),
        ],
      ),
      body: PageView(
        controller: pageController,
        children: [
          HomeScreen(),
          BloodScreen(),
          TeamScreen(),
          CardScreen(),
        ],
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
  checkPayment() async {
    await Future.delayed(Duration(seconds: 1));
    if(ProfileController.to.profile.value!.statusDetails.toString() == "Membership fee not paid yet."){
      // Get.offAllNamed(AppRoutes.CHECKOUT);
    }
  }
}
