import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'Controllers/profile_controller.dart';
import 'Core/AppRoutes.dart';
import 'Data/Models/profile_model.dart';
import 'Presentation/AllScreen/Notification/notificationService.dart';

void main() async {
  // WidgetsBinding.instance?.ensureVisualUpdate();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // MobileAds.instance.initialize();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Get.lazyPut(() => ProfileController());
    NotificationService.init();
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      print("FirebaseMessaging.getInitialMessage");
      if (message != null) {
        // message.notification!.title == "A new SALE is here!" ? Get.toNamed(AppRoutes.NOTIFICATION) :  Get.toNamed(AppRoutes.CHATALL);
      }
    });
    storeUserData();
  }

  void storeUserData() async {
    if (FirebaseAuth.instance.currentUser != null) {
      var profile = await ProfileModel.getProfileByUserId(
          uId: FirebaseAuth.instance.currentUser!.uid);
      ProfileController.to.profile(profile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'দুর্বার',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)),
      initialRoute: FirebaseAuth.instance.currentUser == null ? AppRoutes.LOGINSCREEN : AppRoutes.MAINSCREEN,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
