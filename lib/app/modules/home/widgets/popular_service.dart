import 'package:firebase_assesment_bip/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PopularServiceWidget extends StatelessWidget {
  final String title;
  final String address;
  final String distance;
  final String rating;
  final String review;
  ImageProvider<Object> image;
  PopularServiceWidget(
      {super.key,
      required this.address,
      required this.distance,
      required this.image,
      required this.rating,
      required this.review,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: Colors.blueGrey[50]),
      child: Row(
        children: [
          Container(
            width: 130.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: image,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
                      child: Text(
                        "$title",
                        style: TextStyle(
                            fontSize: 15.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Text(
                        "$address",
                        style:
                            TextStyle(fontSize: 13.sp, color: Colors.grey[600]),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 8.h, horizontal: 5.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: ColorConstant.primary,
                            size: 23.sp,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5.w),
                            child: Text(
                              "$distance",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey[700],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.star_half_outlined,
                                color: ColorConstant.secondry,
                                size: 23.sp,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 5.w),
                                child: Text(
                                  "$rating",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Container(
                              height: 10.h,
                              width: 2.w,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "$review Reviews",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
