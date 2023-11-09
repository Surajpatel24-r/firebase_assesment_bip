import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_assesment_bip/app/data/models/coupon.dart';
import 'package:get/get.dart';
import '../../data/providers/firebase_provider.dart';

class HomeController extends GetxController {
  final FirebaseProvider _firebaseProvider = FirebaseProvider();
  final RxList<dynamic> categories = RxList<dynamic>();

  @override
  void onInit() {
    categories.bindStream(_firebaseProvider.getCategoriesStream());
    getPopularServices();
    fetchFeatures();
    fetchCoupons();
    super.onInit();
  }

  var selectedTabIndex = 0.obs;
  var popularServices = <dynamic>[].obs;
  var featuresList = <DocumentSnapshot>[].obs;
  var coupons = [].obs;

  void changeTabIndex(int index) {
    selectedTabIndex.value = index;
  }

  void getPopularServices() async {
    FirebaseFirestore.instance
        .collection('mostPopularService')
        .limit(6) // limit to 6 documents
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        popularServices
            .add(doc.data()); // Add document data to the observable list
      }
      // ignore: invalid_return_type_for_catch_error
    }).catchError((error) => print('Get popular services failed: $error'));
  }

  void fetchFeatures() async {
    var featuresCollection = FirebaseFirestore.instance.collection('features');
    var snapshots = await featuresCollection.get();
    featuresList.assignAll(snapshots.docs);
  }

  void fetchCoupons() async {
    var result = await FirebaseFirestore.instance.collection('coupon').get();
    if (result.docs.isNotEmpty) {
      coupons.assignAll(result.docs
          .map((document) => CouponModel.fromDocumentSnapshot(document))
          .toList());
    }
  }
}
