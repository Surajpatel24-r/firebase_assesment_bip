// // ignore_for_file: unnecessary_null_comparison, unused_field
// ignore_for_file: unnecessary_null_comparison, unused_field

import 'package:country_picker/country_picker.dart';
import 'package:firebase_assesment_bip/app/modules/base/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/models/userModel.dart';
import '../../data/providers/firebase_provider.dart';
import '../../data/providers/storage_provider.dart';
import '../home/view.dart';

class AuthScreenController extends GetxController {
  final FirebaseProvider _firebaseProvider = FirebaseProvider();
  final _storageProvider = StorageProvider();

  UserModel? user;

  final loginFormKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();

  //mobile auth
  final numberEditingController = TextEditingController();
  final otpEditingController = TextEditingController();

  // Setter Getter
  var isLoading = false.obs;
  void setLoading(bool value) {
    isLoading.value = value;
  }

  void phoneNumberAuthentication() async {
    isLoading.value = true;
    String mobile = numberEditingController.text;
    if (mobile == "") {
      isLoading.value = false;
      Get.snackbar(
        "Please enter the mobile number!",
        "Failed",
      );
    } else {
      _firebaseProvider.verifyPhoneNumber("+91$mobile");
      isLoading.value = false;
    }
    isLoading.value = false;
  }

  void otpVerificationAndLogin(String otpCode) async {
    var isVerified = await _firebaseProvider.verifyOtp(otpCode);
    isVerified ? Get.offAll(() => AppBase()) : Get.back();
  }

  @override
  void dispose() {
    numberEditingController.dispose();
    otpEditingController.dispose();
    super.dispose();
  }
}
