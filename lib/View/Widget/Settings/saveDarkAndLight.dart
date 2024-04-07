import 'package:asrooshop/Logic/Controller/ControllerWithObx.dart';
import 'package:asrooshop/Logic/Controller/SaveDarkMode.dart';
import 'package:asrooshop/Utils/Constant/ConstantColor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaveDark extends StatelessWidget {
  final controller = Get.find<ControllerM>();
  SaveDark({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              child: Row(children: [
            Container(
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  Icons.dark_mode,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  size: 21,
                )),
            SizedBox(width: 20),
            Text("Dark Mode".tr,
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold)),
          ])),
          Transform.scale(
            scale: 0.9,
            child: Switch(
                inactiveTrackColor: pink,
                activeColor: Colors.green,
                activeTrackColor: Colors.grey.withOpacity(0.3),
                value: controller.swich.value,
                onChanged: (value) {
                  controller.swich.value = value;
                  SaveDarkMode().ChangeTheme();
                }),
          ),
        ]),
      ),
    );
  }
}
