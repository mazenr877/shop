import 'package:asrooshop/Logic/Controller/Controller.dart';
import 'package:asrooshop/Logic/Controller/ControllerWithObx.dart';
import 'package:asrooshop/Utils/Constant/ConstantColor.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogOut extends StatelessWidget {
  LogOut({super.key});
  final controller = Get.find<ControllerM>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePage>(
      init: HomePage(),
      builder: (controller) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          onTap: () {
            Get.defaultDialog(
                title: "Log out from App",
                titleStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                onConfirm: () {
                  controller.SignOut();
                },
                onCancel: () {
                  Get.back();
                },
                cancelTextColor: Colors.white,
                confirmTextColor: Colors.white,
                textConfirm: "LogOut",
                textCancel: "No",
                backgroundColor: Colors.grey,
                buttonColor: Get.isDarkMode ? Colors.pink : Colors.green,
                middleText: "Are you sure to need to logout",
                middleTextStyle: TextStyle(
                    fontSize: 10,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                radius: 20);
          },
          splashColor: Get.isDarkMode ? pink : Colors.green,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                child: Row(children: [
              Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    Icons.logout,
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                    size: 17,
                  )),
              SizedBox(width: 20),
              Text("Log Out".tr,
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.bold)),
            ])),
          ]),
        ),
      ),
    );
  }
}
