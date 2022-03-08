import 'package:BornoBangla/Data/Models/course_model.dart';
import 'package:BornoBangla/Data/Models/university_model.dart';
import 'package:get/get.dart';

class ScholarshipController extends GetxController {
  static ScholarshipController to = Get.find();
  Rx<UniversityModel?> university = Rx<UniversityModel?>(null);
  Rx<CourseModel?> course = Rx<CourseModel?>(null);
}
