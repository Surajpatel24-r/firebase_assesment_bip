import 'package:firebase_assesment_bip/app/modules/authentication/binding.dart';
import 'package:firebase_assesment_bip/app/routes/routes.dart';
import 'package:get/get.dart';

import '../modules/authentication/views/login.dart';

class GetPages {
  static final pages = [
    GetPage(
      name: '/',
      page: () => AuthScreen(),
      binding: AuthScreenControllerBinding(),
    ),
    // GetPage(
    //   name: AppRoute.welcome,
    //   page: () => WelcomeScreen(),
    //   binding: WelcomeControllerBinding(),
    // ),
    // GetPage(
    //   name: AppRoute.login,
    //   page: () => AuthScreen(),
    //   binding: AuthScreenControllerBinding(),
    // ),
    // GetPage(
    //   name: AppRoute.home,
    //   page: () => HomeScreen(),
    //   binding: HomeBinding(),
    // ),
  ];
}
