// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedWidget extends StatelessWidget {
  final String text;
  final String text_price;
  final String old_text_price;
  ImageProvider<Object> image;
  FeaturedWidget(
      {super.key,
      required this.text,
      required this.image,
      required this.old_text_price,
      required this.text_price});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 2,
      child: Container(
        height: 150.h,
        width: 160.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Container(
              height: 100.h,
              width: 160.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Image(
                image: image,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Text(
                        "$text",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: Row(
                        children: [
                          Text(
                            "Rs $text_price",
                            style: TextStyle(fontSize: 15.sp),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Text(
                            "Rs $old_text_price",
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
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
    );
  }
}
