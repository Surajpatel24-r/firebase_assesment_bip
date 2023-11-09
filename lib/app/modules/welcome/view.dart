// import 'package:cmp_walkthrough_app/app/modules/authentication/views/login.dart';
// import 'package:cmp_walkthrough_app/app/modules/welcome/controller.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import '../../core/values/colors.dart';
// import 'content_model.dart';

// class WelcomeScreen extends StatelessWidget {
//   WelcomeScreen({super.key});

//   final WelcomeController _controller = Get.put(WelcomeController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: PageView.builder(
//               controller: _controller.pageController,
//               itemCount: contents.length,
//               onPageChanged: (int index) {
//                 _controller.currentIndex.value = index;
//               },
//               itemBuilder: (_, i) {
//                 return Column(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: 24.w, vertical: 40.h),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               Get.offAll(() => AuthScreen());
//                             },
//                             child: Container(
//                               height: 22.h,
//                               width: 56.w,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: ColorConstant.primary_light,
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   "Skip",
//                                   style: TextStyle(
//                                     fontSize: 14.sp,
//                                     fontFamily: "Lexend-Regular",
//                                     color: ColorConstant.primary,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(
//                       height: 43.h,
//                     ),
//                     Container(
//                       height: 432.h,
//                       child: Column(
//                         children: [
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 24.w, vertical: 23.h),
//                             child: Container(
//                               width: 300.w,
//                               child: Image.asset(
//                                 contents[i].image,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           Center(
//                             child: Text(
//                               contents[i].title,
//                               style: TextStyle(
//                                 fontSize: 25.sp,
//                                 fontFamily: "Lexend-Regular",
//                               ),
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.symmetric(
//                                 horizontal: 24.w, vertical: 16.h),
//                             child: Text(
//                               contents[i].description,
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                 fontSize: 16.sp,
//                                 fontFamily: "Lexend-Light",
//                                 color: ColorConstant.grey,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ),
//           Container(
//             child: Obx(
//               () => Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(
//                   contents.length,
//                   (index) => buildDot(index, context),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.only(top: 20.h, bottom: 10.h),
//             child: Obx(
//               () => InkWell(
//                 onTap: () {
//                   if (_controller.currentIndex.value == contents.length - 1) {
//                     Get.off(() => AuthScreen());
//                   }
//                   _controller.pageController.nextPage(
//                     duration: Duration(milliseconds: 100),
//                     curve: Curves.bounceIn,
//                   );
//                   print("Current Index: ${_controller.currentIndex.value}");
//                 },
//                 child: _controller.currentIndex.value == contents.length - 1
//                     ? Container(
//                         height: 45.h,
//                         width: 180.w,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(36),
//                           color: ColorConstant.primary_light,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.only(left: 5.w),
//                               child: Text(
//                                 "Get Started",
//                                 style: TextStyle(
//                                   fontSize: 15.sp,
//                                   fontFamily: "Lexend-Regular",
//                                   color: ColorConstant.primary,
//                                 ),
//                               ),
//                             ),
//                             CircleAvatar(
//                               radius: 20.r,
//                               backgroundColor: ColorConstant.primary,
//                               child: Icon(Icons.arrow_forward),
//                             ),
//                           ],
//                         ),
//                       )
//                     : CircleAvatar(
//                         radius: 30.r,
//                         backgroundColor: ColorConstant.primary_light,
//                         child: CircleAvatar(
//                           radius: 21.r,
//                           backgroundColor: ColorConstant.primary,
//                           child: Icon(Icons.arrow_forward),
//                         ),
//                       ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Container buildDot(int index, BuildContext context) {
//     return Container(
//       height: 10,
//       width: _controller.currentIndex.value == index ? 25 : 10,
//       margin: EdgeInsets.only(right: 5),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: ColorConstant.primary,
//       ),
//     );
//   }
// }
