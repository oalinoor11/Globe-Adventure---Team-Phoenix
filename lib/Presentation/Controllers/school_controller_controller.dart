import 'package:get/get.dart';

class SchoolController extends GetxController {
  static SchoolController to = Get.find<SchoolController>();
  var selectedCountry = RxString('');
}
