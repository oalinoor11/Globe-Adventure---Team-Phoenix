import 'package:BornoBangla/Presentation/AllScreen/ApplyScholarshipScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/CareerCoachScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/CoursesScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/PreparationScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Questions/HomeScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/SplashScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/UniversityScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';


class AppRoutes {
  static const String INITAL = "/";
  static const String HOMESCREEN = "/firstscreen";
  static const String UNIVERSITYSCREEN = "/universityscreen";
  static const String COURSESSCREEN = "/coursesscreen";
  static const String PREPARATIONSCREEN = "/preparationscreen";
  static const String CAREERCOACHSCREEN = "/careercoachscreen";
  static const String APPLYSCHOLARSHIPSCREEN = "/applyscholarshipscreen";

  static List<GetPage> routes = [
    GetPage(
        name: INITAL,
        page: () => SplashScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: HOMESCREEN,
        page: () => HomeScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: UNIVERSITYSCREEN,
        page: () => UniversityScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: COURSESSCREEN,
        page: () => CoursesScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: PREPARATIONSCREEN,
        page: () => PreparationScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: CAREERCOACHSCREEN,
        page: () => CareerCoachScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: APPLYSCHOLARSHIPSCREEN,
        page: () => ApplyScholarshipScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

  ];
}
