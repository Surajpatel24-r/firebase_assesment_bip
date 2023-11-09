// ignore_for_file: unused_field, unnecessary_null_comparison

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_assesment_bip/app/modules/authentication/views/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../models/userModel.dart';

class FirebaseProvider {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var verificationId = ''.obs;

  // Phone Number Authentication
  Future<void> verifyPhoneNumber(String phoneNumber) async {
    try {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (credential) async {
          await _firebaseAuth.signInWithCredential(credential);
        },
        codeSent: (verificationId, resendToken) async {
          this.verificationId.value = verificationId;
          Get.to(
              AuthOTPScreen(
                formattedPhoneNumber: formatPhoneNumber(phoneNumber),
              ),
              arguments: [verificationId]);
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'This provided phone number is not valid.',
                snackPosition: SnackPosition.TOP);
          } else {
            Get.snackbar("Error", "Somthing Went Wrong. Try again.",
                snackPosition: SnackPosition.TOP);
          }
        },
      );
    } catch (e) {
      Get.snackbar("An error occurred while verifying the phone number.", "");
    }
  }

  String formatPhoneNumber(String phoneNumber) {
    String numericOnly = phoneNumber.replaceAll(RegExp(r'[^0-9]'), '');
    String lastFourDigits = numericOnly.substring(numericOnly.length - 4);
    return "XXXXXX" + lastFourDigits;
  }

// verify otp
  Future<bool> verifyOtp(String userOtp) async {
    var credentials = await _firebaseAuth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: userOtp));
    return credentials.user != null ? true : false;
  }

  // user data show
  Future<void> uploadUserData(UserModel userModel) async {
    try {
      final CollectionReference usersCollection =
          _firestore.collection('users');
      await usersCollection.doc(userModel.uid).set(userModel.toJson());
    } catch (e) {
      print('Error saving user data to Firestore: $e');
      throw e;
    }
  }

  // Get Categories
  Stream<List<dynamic>> getCategoriesStream() {
    return _firestore
        .collection('category')
        .snapshots()
        .map((QuerySnapshot query) {
      List<dynamic> retVal = [];
      for (var element in query.docs) {
        retVal.add(element.data());
      }
      return retVal;
    });
  }
}
