import 'package:get/get.dart';
import 'controller.dart';

class BaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BaseController());
  }
}
