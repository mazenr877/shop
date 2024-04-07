// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, invalid_use_of_protected_member, deprecated_member_use, must_be_immutable

// import 'package:asrooshop/Logic/Controller/ControllerWithObx.dart';
import 'package:asrooshop/Logic/Controller/ControllerGetApi.dart';
import 'package:asrooshop/Logic/Controller/ControllerWithObx.dart';
import 'package:asrooshop/View/Screen/CardItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class MainScreen extends StatelessWidget {
  ControllerM controller = Get.put(ControllerM());
  final controllers = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
          backgroundColor: context.theme.colorScheme.background,
          appBar: AppBar(
            elevation: 0,
            title: Text(
              "${controller.Bar.value[controller.current.value]}",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            actions: [
              badges.Badge(
                  position: badges.BadgePosition.topEnd(top: 5, end: 5),
                  badgeAnimation: badges.BadgeAnimation.slide(),
                  badgeContent: Text(
                    "${controllers.ProductMap.length}",
                    style: TextStyle(color: Colors.white),
                  ),
                  child: IconButton(
                      onPressed: () {
                        Get.to(() => CardItem());
                      },
                      icon: Image.asset(
                        "images/shop.png",
                        width: 40,
                        height: 40,
                      )))
            ],
            centerTitle: true,
            backgroundColor: Get.isDarkMode ? Colors.black : Colors.green,
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(top: 15),
            child: BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.current.value,
              backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
              items: [
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.home,
                        color: Get.isDarkMode ? Colors.pink : Colors.green),
                    label: "",
                    icon: Icon(Icons.home,
                        color: Get.isDarkMode ? Colors.white : Colors.black)),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.category,
                        color: Get.isDarkMode ? Colors.pink : Colors.green),
                    label: "",
                    icon: Icon(Icons.category,
                        color: Get.isDarkMode ? Colors.white : Colors.black)),
                BottomNavigationBarItem(
                    activeIcon: Icon(Icons.favorite,
                        color: Get.isDarkMode ? Colors.pink : Colors.green),
                    label: "",
                    icon: Icon(Icons.favorite,
                        color: Get.isDarkMode ? Colors.white : Colors.black)),
                BottomNavigationBarItem(
                    activeIcon: Icon(
                      Icons.settings,
                      color: Get.isDarkMode ? Colors.pink : Colors.green,
                    ),
                    label: "",
                    icon: Icon(Icons.settings,
                        color: Get.isDarkMode ? Colors.white : Colors.black)),
              ],
              onTap: (index) {
                controller.current.value = index;
              },
            ),
          ),
          body: IndexedStack(
              index: controller.current.value, 
              children: controller.Tab.value));
    }));
  }
}
