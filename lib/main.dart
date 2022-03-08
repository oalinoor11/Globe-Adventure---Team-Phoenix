import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Core/AppRoutes.dart';

void main() async {
  // WidgetsBinding.instance?.ensureVisualUpdate();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

DatabaseReference userRef =
    FirebaseDatabase.instance.reference().child("users");

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Borno Bangla',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)),
      initialRoute: AppRoutes.MAINSCREEN,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
