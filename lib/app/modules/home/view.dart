import 'package:firebase_assesment_bip/app/core/values/colors.dart';
import 'package:firebase_assesment_bip/app/modules/home/widgets/coupons.dart';
import 'package:firebase_assesment_bip/app/modules/home/widgets/custom_tab_bar.dart';
import 'package:firebase_assesment_bip/app/modules/home/widgets/popular_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../data/models/coupon.dart';
import '../../data/models/gridClass.dart';
import '../category/view.dart';
import '../category/widgets/grid.dart';
import 'controller.dart';
import 'widgets/featured.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController tabController = Get.put(HomeController());
  final List<String> tabItems = ["All", "Haircuts", "Make up", "Manicure"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: CircleAvatar(
                                radius: 23.r,
                                backgroundImage:
                                    AssetImage('assets/images/banner.png'),
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  "Good Morning",
                                  style: TextStyle(
                                      fontSize: 15.sp, color: Colors.grey[500]),
                                ),
                                Text(
                                  "Suraj Patel",
                                  style: TextStyle(
                                      fontSize: 18.sp, color: Colors.black87),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.w),
                            child: Icon(Icons.notifications_outlined,
                                size: 35.r, color: Colors.grey[700]),
                          ),
                          Icon(Icons.stars_outlined,
                              size: 35.r, color: Colors.grey[700]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Container(
                  height: 45.h,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16.r)),
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        fillColor: Color.fromARGB(255, 207, 207, 207),
                        prefixIcon: InkWell(
                          child: Icon(
                            Icons.search_outlined,
                            color: Colors.grey,
                            size: 25.r,
                          ),
                        ),
                        suffixIcon: InkWell(
                          child: Icon(
                            Icons.filter_alt_outlined,
                            color: Colors.grey,
                            size: 25.r,
                          ),
                        ),
                        hintText: "Search",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.r))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Obx(() {
                  if (tabController.coupons.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Container(
                    height: 150.h,
                    child: ListView.builder(
                      itemCount: tabController.coupons.length,
                      itemBuilder: (context, index) {
                        CouponModel coupon = tabController.coupons[index];
                        return CouponsWidget(
                          headingText: coupon.headingText,
                          image: NetworkImage(coupon.image),
                          offText: coupon.discount,
                          subtitle: coupon.subtitleText,
                        );
                      },
                    ),
                  );
                }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Featured Services",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: "Lexend-Regular",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 5.h,
                            width: 22.w,
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorConstant.primary,
                            ),
                          ),
                          Container(
                            height: 5.h,
                            width: 6.w,
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorConstant.primary,
                            ),
                          ),
                          Container(
                            height: 5.h,
                            width: 6.w,
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: ColorConstant.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Obx(() {
                  if (tabController.featuresList.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Container(
                    height: 165.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tabController.featuresList.length,
                      itemBuilder: (context, index) {
                        var feature = tabController.featuresList[index].data()
                            as Map<String, dynamic>;
                        return FeaturedWidget(
                          image: NetworkImage(feature['featuresImage']),
                          old_text_price: feature['featuresOldPrice'],
                          text: feature['featuresText'],
                          text_price: feature['featuresPrice'],
                        );
                      },
                    ),
                  );
                }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: "Lexend-Regular",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Get.to(() => CategoryScreen());
                        },
                        child: Text(
                          "View All",
                          style: TextStyle(
                            color: ColorConstant.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w),
                child: Obx(() {
                  if (tabController.categories.isEmpty) {
                    return Center(child: CircularProgressIndicator());
                  }
                  int itemsPerRow = MediaQuery.of(context).size.width ~/ 120.w;
                  // To ensure you don't go out of bounds when less than 6 items are present
                  int displayCount = tabController.categories.length > 6
                      ? 6
                      : tabController.categories.length;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: itemsPerRow,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h,
                      childAspectRatio: (1 / 1),
                    ),
                    itemCount: displayCount,
                    itemBuilder: (context, index) {
                      var item = tabController.categories[index];
                      return GridItemWidget(
                          item: GridItem(
                        imagePath: item['categoryImage'],
                        title: item['categoryText'],
                      ));
                    },
                  );
                }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most Popular Services",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: "Lexend-Regular",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: CustomTabBar(
                      tabItems: tabItems, controller: tabController),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 17.h, horizontal: 6.w),
                child: Obx(() {
                  switch (tabController.selectedTabIndex.value) {
                    case 0:
                      if (tabController.popularServices.isEmpty) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: tabController.popularServices.length,
                        itemBuilder: (context, index) {
                          final service = tabController.popularServices[index];
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 14.w, vertical: 10.h),
                            child: PopularServiceWidget(
                              address: service['address'],
                              distance: service['distance'],
                              image: NetworkImage(service['image']),
                              rating: service['rating'].toString(),
                              review: service['review'].toString(),
                              title: service['title'],
                            ),
                          );
                        },
                      );
                    case 1:
                      return Container();
                    case 2:
                      return Container();
                    case 3:
                      return Container();
                    default:
                      return Container();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
