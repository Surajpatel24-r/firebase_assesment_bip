import 'package:firebase_assesment_bip/app/modules/authentication/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../../../core/values/images.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final _controller = Get.put(AuthScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _controller.loginFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 300.h,
                        width: double.infinity,
                        decoration: const BoxDecoration(),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Container(
                                height: 260.h,
                                width: 260.w,
                                // color: Colors.blue,
                                child: const Image(
                                  image: AssetImage(ImagesConstant.logo),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Stack(
                          children: [
                            Container(
                              height: 280.h,
                              // color: Colors.amber,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Card(
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Container(
                                      height: 250.h,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        // color: Colors.amber,
                                      ),
                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.w,
                                                vertical: 40.h),
                                            child: TextFormField(
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
                                              controller: _controller
                                                  .numberEditingController,
                                              keyboardType: TextInputType.phone,
                                              validator: (value) {},
                                              decoration: const InputDecoration(
                                                hintText: "Enter Phone number",
                                                suffixIcon: Icon(Icons.call),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.w,
                                                vertical: 12.h),
                                            child: SizedBox(
                                              height: 42.h,
                                              width: double.infinity,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      ColorConstant.primary,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  _controller
                                                      .phoneNumberAuthentication();
                                                },
                                                child: Text(
                                                  "Login",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 222.w,
                                            // color: Colors.amber,
                                            child: Column(
                                              children: [
                                                Text(
                                                  "By continuing, you agree to our ",
                                                  style: TextStyle(
                                                    fontSize: 13.sp,
                                                    color: ColorConstant.grey,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  "Terms & Conditions and Privacy Policy",
                                                  style: TextStyle(
                                                    fontSize: 13.sp,
                                                    color:
                                                        ColorConstant.primary,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 3,
                                      color: Colors.grey,
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: CircleAvatar(
                                  radius: 30.r,
                                  backgroundColor: Colors.white,
                                  child: const Center(
                                    child: Icon(
                                      Icons.person_add_alt_1_outlined,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
