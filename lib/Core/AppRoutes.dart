import 'package:BornoBangla/Presentation/AllScreen/Questions/HomeScreen.dart';
import 'package:BornoBangla/Presentation/AllScreen/SplashScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';


class AppRoutes {
  static const String INITAL = "/";
  static const String HOMESCREEN = "/firstscreen";

  static List<GetPage> routes = [
    GetPage(
        name: INITAL,
        page: () => SplashScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

    GetPage(
        name: HOMESCREEN,
        page: () => HomeScreen(),
        transitionDuration: Duration(milliseconds: 100),
        transition: Transition.zoom),

  ];
}
