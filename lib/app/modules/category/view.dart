import 'package:firebase_assesment_bip/app/modules/category/widgets/grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../data/models/gridClass.dart';
import 'controller.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});
  final CategoryController categoryController = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Center(
          child: Text(
            "Category",
            style: TextStyle(color: Colors.black87),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 24.h),
        child: Obx(() {
          if (categoryController.categories.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          int itemsPerRow = MediaQuery.of(context).size.width ~/ 120.w;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: itemsPerRow,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: (1 / 1),
            ),
            itemCount: categoryController.categories.length,
            itemBuilder: (context, index) {
              var item = categoryController.categories[index];
              return GridItemWidget(
                  item: GridItem(
                imagePath: item['categoryImage'],
                title: item['categoryText'],
              ));
            },
          );
        }),
      ),
    );
  }
}
