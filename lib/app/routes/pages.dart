import 'package:firebase_assesment_bip/app/modules/authentication/binding.dart';
import 'package:firebase_assesment_bip/app/modules/base/view.dart';
import 'package:firebase_assesment_bip/app/modules/category/binding.dart';
import 'package:firebase_assesment_bip/app/modules/category/controller.dart';
import 'package:firebase_assesment_bip/app/modules/category/view.dart';
import 'package:firebase_assesment_bip/app/modules/home/binding.dart';
import 'package:firebase_assesment_bip/app/modules/home/view.dart';
import 'package:firebase_assesment_bip/app/routes/routes.dart';
import 'package:get/get.dart';

import '../modules/authentication/views/login.dart';
import '../modules/base/binding.dart';

class GetPages {
  static final pages = [
    GetPage(
      name: '/',
      page: () => AuthScreen(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: AppRoute.appbase,
      page: () => AppBase(),
      binding: AuthScreenControllerBinding(),
    ),
    GetPage(
      name: AppRoute.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoute.category,
      page: () => CategoryScreen(),
      binding: CategoryBinding(),
    ),
  ];
}
