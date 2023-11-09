import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/view.dart';

class BaseController extends GetxController {
  var tabIndex = 0;
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
  }
}
