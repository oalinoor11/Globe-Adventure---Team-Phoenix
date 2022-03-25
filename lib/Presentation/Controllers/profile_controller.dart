import 'package:BornoBangla/Data/Models/profile_model.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController to = Get.find();
  var profile = Rx<ProfileModel?>(null);
}
