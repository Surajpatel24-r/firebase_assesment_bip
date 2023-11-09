import 'package:firebase_assesment_bip/app/core/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> tabItems;
  final HomeController controller;

  CustomTabBar({required this.tabItems, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List<Widget>.generate(tabItems.length, (index) {
            return GestureDetector(
              onTap: () {
                controller.changeTabIndex(index);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                decoration: BoxDecoration(
                  color: controller.selectedTabIndex.value == index
                      ? ColorConstant.primary
                      : ColorConstant.primary_light,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  tabItems[index],
                  style: TextStyle(
                    color: controller.selectedTabIndex.value == index
                        ? Colors.white
                        : ColorConstant.primary,
                  ),
                ),
              ),
            );
          }),
        ));
  }
}
