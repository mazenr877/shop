// ignore_for_file: deprecated_member_use
import 'package:asrooshop/View/Widget/Settings/changeLanguage.dart';
import 'package:asrooshop/View/Widget/Settings/logOut.dart';
import 'package:asrooshop/View/Widget/Settings/profileImage.dart';
import 'package:asrooshop/View/Widget/Settings/saveDarkAndLight.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: context.theme.colorScheme.background,
          body: Container(
              padding: EdgeInsets.symmetric(horizontal: 9),
              child: ListView(
                children: [
                  ProfileImage(),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Divider()),
                  SizedBox(height: 20),
                  Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Text("GENERAL".tr,
                          style: TextStyle(
                              color: Get.isDarkMode
                                  ? Colors.pink
                                  : Colors.green))),
                  SizedBox(height: 20),
                  SaveDark(),
                  SizedBox(height: 20),
                  ChangeLanguage(),
                  SizedBox(height: 30),
                  LogOut()
                ],
              ))),
    );
  }
}
