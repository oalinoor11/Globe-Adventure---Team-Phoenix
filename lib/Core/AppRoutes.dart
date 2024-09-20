import 'package:durbarclub/Presentation/AllScreen/Home/HomeScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../Presentation/AllScreen/Authentication/ForgetScreen.dart';
import '../Presentation/AllScreen/Authentication/LoginScreen.dart';
import '../Presentation/AllScreen/Authentication/SignupScreen.dart';
import '../Presentation/AllScreen/Blood/RequestBlood.dart';
import '../Presentation/AllScreen/MainScreen.dart';
import '../Presentation/AllScreen/Notification/NotificationScreen.dart';
import '../Presentation/AllScreen/Notification/SendNotification.dart';
import '../Presentation/AllScreen/Profile/CardScan.dart';
import '../Presentation/AllScreen/Profile/CardscanResult.dart';
class AppRoutes {
  static const String INITAL = "/";
  static const String MAINSCREEN = "/mainscreen";
  static const String HOMESCREEN = "/homescreen";
  static const String LOGINSCREEN = "/loginscreen";
  static const String SIGNUPSCREEN = "/signupscreen";
  static const String FORGETSCREEN = "/forgetscreen";
  static const String SENDNOTIFICATION = "/sendnotification";
  static const String NOTIFICATIONSCREEN = "/notificationscreen";
  static const String CARDSCAN = "/cardscan";
  static const String CARDSCANRESULT = "/cardscanresult";
  static const String REQUESTBLOOD = "/requestblood";

  static List<GetPage> routes = [
    GetPage(
        name: MAINSCREEN,
        page: () => MainScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: HOMESCREEN,
        page: () => HomeScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: LOGINSCREEN,
        page: () => LoginScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: SIGNUPSCREEN,
        page: () => SignupScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: FORGETSCREEN,
        page: () => ForgetScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: SENDNOTIFICATION,
        page: () => SendNotification(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: NOTIFICATIONSCREEN,
        page: () => NotificationScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: CARDSCAN,
        page: () => CardScan(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: CARDSCANRESULT,
        page: () => CardscanResult(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: REQUESTBLOOD,
        page: () => RequestBlood(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
  ];
}
