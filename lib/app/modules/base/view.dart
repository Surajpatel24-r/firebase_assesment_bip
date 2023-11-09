import 'package:firebase_assesment_bip/app/core/values/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import '../category/view.dart';
import '../home/view.dart';
import 'controller.dart';

class AppBase extends StatelessWidget {
  AppBase({super.key});

  final PersistentTabController _persistentController =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      CategoryScreen(),
      HomeScreen(),
      HomeScreen(),
      HomeScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home_filled),
        activeColorPrimary: ColorConstant.primary,
        activeColorSecondary: ColorConstant.primary,
        inactiveColorPrimary: const Color.fromARGB(187, 0, 0, 0),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.dashboard_outlined),
        activeColorPrimary: ColorConstant.primary,
        activeColorSecondary: ColorConstant.primary,
        inactiveColorPrimary: const Color.fromARGB(187, 0, 0, 0),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.calendar_month_outlined),
        activeColorPrimary: ColorConstant.primary,
        activeColorSecondary: ColorConstant.primary,
        inactiveColorPrimary: const Color.fromARGB(187, 0, 0, 0),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.messenger_outline_outlined),
        activeColorPrimary: ColorConstant.primary,
        activeColorSecondary: ColorConstant.primary,
        inactiveColorPrimary: const Color.fromARGB(187, 0, 0, 0),
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_3_outlined),
        activeColorPrimary: ColorConstant.primary,
        activeColorSecondary: ColorConstant.primary,
        inactiveColorPrimary: const Color.fromARGB(187, 0, 0, 0),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _persistentController,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: const Color(0xFFF5F4F4),
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: const EdgeInsets.all(0.0),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style3,
      ),
    );
  }
}
