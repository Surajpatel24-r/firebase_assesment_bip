import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CouponsWidget extends StatelessWidget {
  final String offText;
  final String headingText;
  final String subtitle;
  ImageProvider<Object> image;
  CouponsWidget(
      {super.key,
      required this.image,
      required this.headingText,
      required this.offText,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 348.w,
      margin: EdgeInsets.only(right: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.black,
        image: DecorationImage(
          image: image,
          fit: BoxFit.fill,
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 35.h, left: 14.w),
                child: Container(
                  width: 210.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          "$offText OFF",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "Lexend-Medium",
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15.h),
                        child: Text(
                          "$headingText",
                          style:
                              TextStyle(fontSize: 15.sp, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Text(
                          "$subtitle",
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
