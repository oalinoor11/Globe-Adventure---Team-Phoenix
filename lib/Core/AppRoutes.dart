import 'package:BornoBangla/Presentation/AllScreen/AcademicCoachingScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/AddCoachingScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/AddCourseScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/AdmissionCoachingScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/AdmissionCoachingScreen2.dart';
import 'package:BornoBangla/Presentation/AllScreen/ApplyScholarshipScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/BcsbyrsScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/BcsbytgScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/BkashScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/CareerCoachScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/CoachingApplyScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/CollegeScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/CoursesScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/BookScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/EhokScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Englisha2zScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/IeltsCoachingScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/IssbCoachingScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/JobCoachingScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/JobScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/MabsScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/MainScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/MentorsScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/PreparationScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/ProfileScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Questions/HomeScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/RetinaScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/SIrajacademyScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/SaifursScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/SchoolScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/SignInScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/SplashScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/StudyAbroadScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/TutorScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/UccScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/UniversityScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/UttoronScreen.dart';
import 'package:BornoBangla/Presentation/SignUpScreen.dart';
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
  static const String BOOKSCREEN = "/bookscreen";
  static const String JOBSCREEN = "/jobscreen";
  static const String SIGNINSCREEN = "/signinscreen";
  static const String SIGNUPSCREEN = "/signupscreen";
  static const String STUDYABROADSCREEN = "/sstudyabroadscreen";
  static const String TUTORSCREEN = "/tutorscreen";
  static const String SCHOOLSCREEN = "/schoolscreen";
  static const String COLLEGESCREEN = "/collegescreen";
  static const String ADMISSIONCOACHINGSCREEN = "/admissioncoachingscreen";
  static const String ADMISSIONCOACHINGSCREEN2 = "/admissioncoachingscreen2";
  static const String ADDCOACHINGSCREEN = "/addcoachingscreen";
  static const String ADDCOURSESCREEN = "/addcoursescreen";
  static const String ACADEMICCOACHINGSCREEN = "/academiccoachingscreen";
  static const String IELTSCOACHINGSCREEN = "/ieltscoachingscreen";
  static const String JOBCOACHINGSCREEN = "/jobcoachingscreen";
  static const String ISSBCOACHINGSCREEN = "/issbcoachingscreen";
  static const String UCCSCREEN = "/uccscreen";
  static const String UDVASHSCREEN = "/udvashscreen";
  static const String EHOKSCREEN = "/ehokscreen";
  static const String MABSSCREEN = "/mabsscreen";
  static const String MARSSCREEN = "/marsscreen";
  static const String COACHINGAPPLYSCREEN = "/coachingapplyscreen";
  static const String BKASHSCREEN = "/bkashscreen";
  static const String RETINASCREEN = "/retinascreen";
  static const String ENGLISHA2ZSCREEN = "/englisha2zscreen";
  static const String SAIFURSSCREEN = "/saifursscreen";
  static const String MENTORSSCREEN = "/mentorsscreen";
  static const String BCSBYTGSCREEN = "/bcsbytgscreen";
  static const String BCSBYRSSCREEN = "/bcsbyrsscreen";
  static const String UTTORONSCREEN = "/uttoronscreen";
  static const String SIRAJACADEMYSCREEN = "/sirajacademyscreen";
  static const String PROFILESCREEN = "/profilescreen";

  static List<GetPage> routes = [
    GetPage(
        name: INITAL,
        page: () => SplashScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),
    GetPage(
        name: PROFILESCREEN,
        page: () => ProfileScreen(),
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
        name: BOOKSCREEN,
        page: () => BookScreen(),
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
        name: SIGNUPSCREEN,
        page: () => SignUpScreen(),
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
        name: ADMISSIONCOACHINGSCREEN2,
        page: () => AdmissionCoachingScreen2(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: ADDCOACHINGSCREEN,
        page: () => AddCoachingScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: ADDCOURSESCREEN,
        page: () => AddCourseScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: SIRAJACADEMYSCREEN,
        page: () => SirajacademyScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: IELTSCOACHINGSCREEN,
        page: () => IeltsCoachingScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: JOBCOACHINGSCREEN,
        page: () => JobCoachingScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: ISSBCOACHINGSCREEN,
        page: () => IssbCoachingScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: ACADEMICCOACHINGSCREEN,
        page: () => AcademicCoachingScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: UCCSCREEN,
        page: () => UccScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: BCSBYTGSCREEN,
        page: () => BcsbytgScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: BCSBYRSSCREEN,
        page: () => BcsbyrsScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: UTTORONSCREEN,
        page: () => UttoronScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: MABSSCREEN,
        page: () => MabsScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: EHOKSCREEN,
        page: () => EhokScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: ENGLISHA2ZSCREEN,
        page: () => Englisha2zScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: SAIFURSSCREEN,
        page: () => SaifursScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: MENTORSSCREEN,
        page: () => MentorsScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: COACHINGAPPLYSCREEN,
        page: () => CoachingApplyScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: BKASHSCREEN,
        page: () => BkashScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: RETINASCREEN,
        page: () => RetinaScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

  ];
}
