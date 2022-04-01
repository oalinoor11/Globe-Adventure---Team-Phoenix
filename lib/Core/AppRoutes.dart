import 'package:BornoBangla/Presentation/AllScreen/CareerCoach/AddCareerCoachScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/CareerCoach/BookAppointmentScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/CareerCoach/CareerCoachScreen2.dart';
import 'package:BornoBangla/Presentation/AllScreen/CareerCoach/EditCareerCoachScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Preparation/AddCoachingScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/College/AddCollegeScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Profile/OtpScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/StudyAbroad/AddCountry.dart';
import 'package:BornoBangla/Presentation/AllScreen/Preparation/AddCourseScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Scholarship/AddScholarshipScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/School/AddSchoolScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/University/AddUniversityCourseScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/University/AddUniversityScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Preparation/AdmissionCoachingScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Preparation/AdmissionCoachingScreen2.dart';
import 'package:BornoBangla/Presentation/AllScreen/Scholarship/ApplyScholarshipScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Payment/PaymentScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/CareerCoach/CareerCoachScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Preparation/CoachingApplyScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/College/CollegeScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/College/CollegeScreen2.dart';
import 'package:BornoBangla/Presentation/AllScreen/University/CoursesScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Book/BookScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Preparation/EditCoachingScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/College/EditCollegeScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/StudyAbroad/EditCountryScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/University/EditCourseScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Scholarship/EditScholarshipScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/School/EditSchoolScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/University/EditUniversityScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Job/JobScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/MainScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Preparation/PreparationScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Profile/ProfileScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Home/HomeScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Scholarship/ScholarshipApplyScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/School/SchoolScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/School/SchoolScreen2.dart';
import 'package:BornoBangla/Presentation/AllScreen/Profile/SignInScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/StudyAbroad/StudyAbroadScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Tutor/TutorScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/University/UniversityScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/Profile/SignUpScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../Presentation/AllScreen/Preparation/EditCoachingCourseScreen.dart';
import '../Presentation/AllScreen/Profile/EditProfileScreen.dart';

class AppRoutes {
  static const String INITAL = "/";
  static const String MAINSCREEN = "/mainscreen";
  static const String OTPSCREEN = "/otpscreen";
  static const String HOMESCREEN = "/firstscreen";
  static const String BOOKAPPOINTMENTSCREEN = "/bookappointmentscreen";
  static const String UNIVERSITYSCREEN = "/universityscreen";
  static const String COURSESSCREEN = "/coursesscreen";
  static const String PREPARATIONSCREEN = "/preparationscreen";
  static const String CAREERCOACHSCREEN = "/careercoachscreen";
  static const String CAREERCOACHSCREEN2 = "/careercoachscreen2";
  static const String APPLYSCHOLARSHIPSCREEN = "/applyscholarshipscreen";
  static const String EDITSCHOLARSHIPSCREEN = "/editscholarshipscreen";
  static const String EDITCOURSESCREEN = "/editcoursescreen";
  static const String EDITCOUNTRYSCREEN = "/editcountryscreen";
  static const String EDITCAREERCOACHSCREEN = "/editcareercoachscreen";
  static const String ADDCAREERCOACHSCREEN = "/addcareercoachscreen";
  static const String ADDCOUNTRYSCREEN = "/addcountryscreen";
  static const String ADDCOLLEGESCREEN = "/addcollegescreen";
  static const String EDITCOACHINGSCREEN = "/editcoachingscreen";
  static const String EDITCOACHINGCOURSESCREEN = "/editcoachingcoursescreen";
  static const String EDITSCHOOLSCREEN = "/editschoolscreen";
  static const String EDITCOLLEGESCREEN = "/editcollegescreen";
  static const String EDITUNIVERSITYSCREEN = "/edituniversityscreen";
  static const String ADDUNIVERSITYSCREEN = "/adduniversityscreen";
  static const String ADDSCHOOLSCREEN = "/addschoolscreen";
  static const String ADDUNIVERSITYCOURSESCREEN = "/adduniversitycoursescreen";
  static const String ADDSCHOLARSHIPSCREEN = "/addscholarshipscreen";
  static const String BOOKSCREEN = "/bookscreen";
  static const String JOBSCREEN = "/jobscreen";
  static const String SIGNINSCREEN = "/signinscreen";
  static const String SIGNUPSCREEN = "/signupscreen";
  static const String STUDYABROADSCREEN = "/studyabroadscreen";
  static const String TUTORSCREEN = "/tutorscreen";
  static const String SCHOOLSCREEN = "/schoolscreen";
  static const String SCHOOLSCREEN2 = "/schoolscreen2";
  static const String COLLEGESCREEN2 = "/collegescreen2";
  static const String COLLEGESCREEN = "/collegescreen";
  static const String ADMISSIONCOACHINGSCREEN = "/admissioncoachingscreen";
  static const String ADMISSIONCOACHINGSCREEN2 = "/admissioncoachingscreen2";
  static const String ADDCOACHINGSCREEN = "/addcoachingscreen";
  static const String ADDCOURSESCREEN = "/addcoursescreen";
  static const String UCCSCREEN = "/uccscreen";
  static const String UDVASHSCREEN = "/udvashscreen";
  static const String EHOKSCREEN = "/ehokscreen";
  static const String MABSSCREEN = "/mabsscreen";
  static const String MARSSCREEN = "/marsscreen";
  static const String COACHINGAPPLYSCREEN = "/coachingapplyscreen";
  static const String SCHOLARSHIPAPPLYSCREEN = "/scholarshipapplyscreen";
  static const String PAYMENTSCREEN = "/paymentScreen";
  static const String RETINASCREEN = "/retinascreen";
  static const String ENGLISHA2ZSCREEN = "/englisha2zscreen";
  static const String SAIFURSSCREEN = "/saifursscreen";
  static const String MENTORSSCREEN = "/mentorsscreen";
  static const String BCSBYTGSCREEN = "/bcsbytgscreen";
  static const String BCSBYRSSCREEN = "/bcsbyrsscreen";
  static const String UTTORONSCREEN = "/uttoronscreen";
  static const String SIRAJACADEMYSCREEN = "/sirajacademyscreen";
  static const String PROFILESCREEN = "/profilescreen";
  static const String EDITPROFILESCREEN = "/editprofilescreen";

  static List<GetPage> routes = [
    GetPage(
        name: PROFILESCREEN,
        page: () => ProfileScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: EDITPROFILESCREEN,
        page: () => EditProfileScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: OTPSCREEN,
        page: () => OtpScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
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
        name: UNIVERSITYSCREEN,
        page: () => UniversityScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: COURSESSCREEN,
        page: () => CoursesScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: PREPARATIONSCREEN,
        page: () => PreparationScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: CAREERCOACHSCREEN,
        page: () => CareerCoachScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: BOOKAPPOINTMENTSCREEN,
        page: () => BookAppointmentScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: CAREERCOACHSCREEN2,
        page: () => CareerCoachScreen2(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: APPLYSCHOLARSHIPSCREEN,
        page: () => ApplyScholarshipScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: EDITSCHOLARSHIPSCREEN,
        page: () => EditScholarshipScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: EDITCOACHINGSCREEN,
        page: () => EditCoachingScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: EDITCOACHINGSCREEN,
        page: () => EditCoachingCourseScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: EDITSCHOOLSCREEN,
        page: () => EditSchoolScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: EDITCAREERCOACHSCREEN,
        page: () => EditCareerCoachScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: ADDCAREERCOACHSCREEN,
        page: () => AddCareerCoachScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: EDITUNIVERSITYSCREEN,
        page: () => EditUniversityScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: EDITCOURSESCREEN,
        page: () => EditCourseScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: EDITCOLLEGESCREEN,
        page: () => EditCollegeScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: ADDUNIVERSITYSCREEN,
        page: () => AddUniversityScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: ADDSCHOOLSCREEN,
        page: () => AddSchoolScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: ADDCOLLEGESCREEN,
        page: () => AddCollegeScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: ADDUNIVERSITYCOURSESCREEN,
        page: () => AddUniversityCourseScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: ADDCOUNTRYSCREEN,
        page: () => AddCountryScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: EDITCOUNTRYSCREEN,
        page: () => EditCountryScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: ADDSCHOLARSHIPSCREEN,
        page: () => AddScholarshipScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: BOOKSCREEN,
        page: () => BookScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: JOBSCREEN,
        page: () => JobScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: SIGNINSCREEN,
        page: () => SignInScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: SIGNUPSCREEN,
        page: () => SignUpScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: STUDYABROADSCREEN,
        page: () => StudyAbroadScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: TUTORSCREEN,
        page: () => TutorScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: SCHOOLSCREEN,
        page: () => SchoolScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: SCHOOLSCREEN2,
        page: () => SchoolScreen2(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: COLLEGESCREEN2,
        page: () => CollegeScreen2(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: COLLEGESCREEN,
        page: () => CollegeScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: ADMISSIONCOACHINGSCREEN,
        page: () => AdmissionCoachingScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: ADMISSIONCOACHINGSCREEN2,
        page: () => AdmissionCoachingScreen2(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: ADDCOACHINGSCREEN,
        page: () => AddCoachingScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: ADDCOURSESCREEN,
        page: () => AddCourseScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: COACHINGAPPLYSCREEN,
        page: () => CoachingApplyScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: SCHOLARSHIPAPPLYSCREEN,
        page: () => ScholarshipApplyScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
        name: PAYMENTSCREEN,
        page: () => PaymentScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.cupertino),
    GetPage(
      name: EDITCOACHINGCOURSESCREEN,
      page: () => EditCoachingCourseScreen(),
    ),
  ];
}
