import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Core/AppRoutes.dart';
void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Borno Bangla',
      theme: ThemeData(colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)),
      initialRoute: AppRoutes.INITAL,
      getPages: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
