// // ignore_for_file: non_constant_identifier_names, prefer_const_constructors, depend_on_referenced_packages
// ignore_for_file: unused_local_variable, non_constant_identifier_names
import 'package:asrooshop/Model/Model.dart';
import 'package:asrooshop/Serveces/ServiceCategory.dart';
// import 'package:asrooshop/Utils/Constant/ConstantColor.dart';
import 'package:asrooshop/View/Screen/CardItem.dart';
import 'package:asrooshop/View/Screen/CategoryScreen.dart';
import 'package:asrooshop/View/Screen/FavoriteScreen.dart';
import 'package:asrooshop/View/Screen/HomePageScreen.dart';
import 'package:asrooshop/View/Screen/SettingScreen.dart';
import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
// import 'package:get_storage/get_storage.dart';

class ControllerM extends GetxController {
  
  int index = 0;
  var Loading = true.obs;
  var Loadin = true.obs;

  RxInt current = 0.obs;
  final Tab = [
    HomePageScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingScreen(),
    CardItem()
  ].obs;
  final Bar =
      ["Asroo Shop", "Category", "Favorite", "Setting", "Cart Items"].obs;
  RxList favorite = [].obs;

  // loqic categoryScreen and api with me
  @override
  void onInit() async {
    // LangeLocal = await GetLanguage;
    // TODO: implement onInit

    super.onInit();
    GetApi();
  }

  List<String> Image = [
    "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71pWzhdJNwL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
  ];

  var CategoryNameList = <String>[].obs;
  void GetApi() async {
    var product = await ServicesCategory.getCategoryAPI();
    try {
      Loading(true);
      if (product.isNotEmpty) {
        CategoryNameList.addAll(product);
      }
    } finally {
      Loading(false);
    }
  }

  // controller insideCategory
  var CategoryInsideNameList = <ModelApi>[].obs;

  // void GetInsidCategory(String NameCategory) async {
  //   var product = await InsideCategory.getInsideCategory(NameCategory);
  //   try {
  //     Loading(true);
  //     if (product.isNotEmpty) {
  //       CategoryInsideNameList.value = product;
  //     }
  //   } finally {
  //     Loading(false);
  //   }
  // }
  GetInsidCategory(String NameCategory) async {
    Loadin(true);
    CategoryInsideNameList.value =
        await InsideCategory.getInsideCategory(NameCategory);
    Loadin(false);
  }

  GetInsideCategoryIndex(int index) async {
    var product = await GetInsidCategory(CategoryNameList[index]);

    if (product != null) {
      CategoryInsideNameList.value = product;
    }
  }

  //  Logic Settinhs with changes dark and light

  RxBool swich = true.obs;
  String ChangeNameFromLowerToUpper(String name) {
    return name.split(" ").map((e) => e.capitalize).join(" ");
  }

  // Logic setting with change language

//   GetStorage storage = GetStorage();
//   var LangeLocal = "";
//   void SaveLanguage(String Lange) async {
//     await storage.write("lange", Lange);
//   }

//  Future <String> get GetLanguage async {
//     return await storage.read("lange");
//   }

// void ChangeLanguage(String TypeLange) {
//     SaveLanguage(TypeLange);
//     if (LangeLocal == TypeLange) {
//       return;
//     }
//     if (TypeLange == fre) {
//       LangeLocal = fre;
//       SaveLanguage(fre);
//     } else if (TypeLange == are) {
//       LangeLocal = are;
//       SaveLanguage(are);
//     } else {
//       LangeLocal = ene;
//       SaveLanguage(ene);
//     }

//     update();
//   }

  // Setting logic
  TextEditingController cont = TextEditingController();
  var phone = " yoou phone".obs;
  var val = 1.obs;
  var value = 1.obs;
  var changeColor = false;
  void ChangeColor() {
    changeColor = !changeColor;
  }

  // current Location
  // var Address = " your location".obs;
  // Future<void> GetLocation() async {
  //   Position position = await _determinePosition();
  //   List<Placemark> placemarks =
  //       await placemarkFromCoordinates(position.latitude, position.longitude);
  //   Placemark placemarker = placemarks[0];
  //   Address.value = "${placemarker.country}, ${placemarker.street}";
  // }

  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;

  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled.');
  //   }

  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permissions are denied');
  //     }
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     return Future.error(
  //         'Location permissions are permanently denied, we cannot request permissions.');
  //   }

  //   return await Geolocator.getCurrentPosition();
  // }
}
