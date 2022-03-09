import 'package:BornoBangla/Data/Models/coaching_course_model.dart';
import 'package:BornoBangla/Data/Models/coaching_model.dart';
import 'package:get/get.dart';

class CoachingController extends GetxController {
  static CoachingController to = Get.find();
  var selectedType = ''.obs;
  Rx<CoachingModel?> coachingModel = Rx<CoachingModel?>(null);
  Rx<CoachingCourseModel?> coachingCourseModel = Rx<CoachingCourseModel?>(null);
}
