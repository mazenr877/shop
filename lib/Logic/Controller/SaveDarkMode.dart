// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SaveDarkMode {
  final GetStorage BoxStorage = GetStorage();
  String key = "isDarkMode";

  saveData(bool state) {
    BoxStorage.write(key, state);
  }

  bool getData() {
    return BoxStorage.read<bool>(key) ?? true;
  }

  ThemeMode get Default => getData() ? ThemeMode.dark : ThemeMode.light;

  void ChangeTheme() {
    Get.changeThemeMode(getData() ? ThemeMode.light : ThemeMode.dark);
    saveData(!getData());
    // ? Get.changeThemeMode(ThemeMode.light)
    // : Get.changeThemeMode(ThemeMode.dark);
  }
}
