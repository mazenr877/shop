import 'package:asrooshop/Logic/Controller/Controller.dart';
import 'package:asrooshop/Logic/Controller/ControllerWithObx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({super.key});
  final controller = Get.find<ControllerM>();
  final Controller = Get.put(HomePage());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(
                    image: AssetImage(
                      "images/ground.png",
                    ),
                    fit: BoxFit.cover)),
          ),
          SizedBox(width: 10),
          Column(
            children: [
              Text(
                "${controller.ChangeNameFromLowerToUpper(Controller.DisplayName.value)}",
                style: TextStyle(fontSize: 13),
              ),
              Text("${Controller.DisplayEmail.value}",
                  style: TextStyle(fontSize: 8.5)),
            ],
          )
        ]),
      ),
    );
  }
}
