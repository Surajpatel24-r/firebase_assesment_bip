import 'package:firebase_assesment_bip/app/data/providers/firebase_provider.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  final FirebaseProvider _firebaseProvider = FirebaseProvider();
  final RxList<dynamic> categories = RxList<dynamic>();

  @override
  void onInit() {
    categories.bindStream(_firebaseProvider.getCategoriesStream());
    super.onInit();
  }
}
