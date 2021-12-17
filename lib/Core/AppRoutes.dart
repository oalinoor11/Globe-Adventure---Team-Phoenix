import 'package:BornoBangla/Presentation/AllScreen/AdmissionCoachingScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/ApplyScholarshipScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/CareerCoachScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/CoachingApplyScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/CollegeScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/CoursesScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/FoodScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/JobScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/MainScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/PreparationScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Questions/HomeScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/SchoolScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/SignInScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/SplashScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/StudyAbroadScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/TutorScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/UccScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/UniversityScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';


class AppRoutes {
  static const String INITAL = "/";
  static const String MAINSCREEN = "/mainscreen";
  static const String HOMESCREEN = "/firstscreen";
  static const String UNIVERSITYSCREEN = "/universityscreen";
  static const String COURSESSCREEN = "/coursesscreen";
  static const String PREPARATIONSCREEN = "/preparationscreen";
  static const String CAREERCOACHSCREEN = "/careercoachscreen";
  static const String APPLYSCHOLARSHIPSCREEN = "/applyscholarshipscreen";
  static const String FOODSCREEN = "/foodscreen";
  static const String JOBSCREEN = "/jobscreen";
  static const String SIGNINSCREEN = "/signinscreen";
  static const String STUDYABROADSCREEN = "/sstudyabroadscreen";
  static const String TUTORSCREEN = "/tutorscreen";
  static const String SCHOOLSCREEN = "/schoolscreen";
  static const String COLLEGESCREEN = "/collegescreen";
  static const String ADMISSIONCOACHINGSCREEN = "/admissioncoachingscreen";
  static const String UCCSCREEN = "/uccscreen";
  static const String COACHINGAPPLYSCREEN = "/coachingapplyscreen";

  static List<GetPage> routes = [
    GetPage(
        name: INITAL,
        page: () => SplashScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: MAINSCREEN,
        page: () => MainScreen(),
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

    GetPage(
        name: FOODSCREEN,
        page: () => FoodScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: JOBSCREEN,
        page: () => JobScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: SIGNINSCREEN,
        page: () => SignInScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: STUDYABROADSCREEN,
        page: () => StudyAbroadScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: TUTORSCREEN,
        page: () => TutorScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: SCHOOLSCREEN,
        page: () => SchoolScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: COLLEGESCREEN,
        page: () => CollegeScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: ADMISSIONCOACHINGSCREEN,
        page: () => AdmissionCoachingScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: UCCSCREEN,
        page: () => UccScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: COACHINGAPPLYSCREEN,
        page: () => CoachingApplyScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

  ];
}
