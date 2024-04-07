// ignore_for_file: file_names, unused_local_variable, unnecessary_import, invalid_use_of_protected_member, non_constant_identifier_names

import 'package:asrooshop/Model/Model.dart';
import 'package:asrooshop/Serveces/GetApi.dart';
import 'package:asrooshop/View/Screen/CardItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

class ApiController extends GetxController {
  var productList = <ModelApi>[].obs;
  var IsLoading = true.obs;
  GetStorage Storage = GetStorage();
  @override
  void onInit() {
    super.onInit();

    List? Shop = Storage.read("favorite");
    if (Shop != null) {
      productFavorite = Shop.map((e) => ModelApi.fromJson(e)).toList().obs;
    }

    GetApi();
  }

  void GetApi() async {
    var product = await ProductServices.getApi();
    try {
      IsLoading(true);
      if (product.isNotEmpty) {
        productList.addAll(product);
      }
    } finally {
      IsLoading(false);
    }
  }

  // logic product favoritscreen
  // AddProduct and Remove
  // Save Data About GetStorage

  var productFavorite = <ModelApi>[].obs;

  void MangeFavorite(int id) {
    var index = productFavorite.indexWhere((element) => element.id == id);
    if (index >= 0) {
      productFavorite.removeAt(index);
      Storage.remove("favorite");
    } else {
      productFavorite
          .add(productList.firstWhere((element) => element.id == id));
      Storage.write("favorite", productFavorite);
    }
  }

  bool AddFavorite(int id) {
    return productFavorite.any((element) => element.id == id);
  }

  //  logic checkBox CardItem
  // delete cheeckBox and Ad checkBox And Count Item In CheckBox
var ProductMap = {}.obs;
  get SupTotal => ProductMap.entries.map((e) => e.key.price * e.value).toList();
  get Total => ProductMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);
  
  void AddProductFromCard(ModelApi modelapi) {
    Storage.write("favorite", productFavorite);
    if (ProductMap.containsKey(modelapi)) {
      ProductMap[modelapi] += 1;
    } else {
      ProductMap[modelapi] = 1;
    }
  }

  void RemoveProductsFromCard(ModelApi modelapi) {
    Storage.remove("favorite");
    if (ProductMap.containsKey(modelapi) && ProductMap[modelapi] == 1) {
      ProductMap.removeWhere((key, value) => key == modelapi);
    } else {
      ProductMap[modelapi] -= 1;
    }
    ;
  }

  void RemoveOneProductFromCard(ModelApi modelapi) {
    ProductMap.removeWhere((key, value) => key == modelapi);
  }

  void ClearAllProductFromCard() {
    Get.defaultDialog(
        content: Text("Are You Clear All Product"),
        backgroundColor: Colors.green[200],
        buttonColor: Colors.green,
        textConfirm: "Yes",
        textCancel: "No",
        onCancel: () {
          Get.off(() => CardItem());
        },
        onConfirm: () {
          ProductMap.clear();
          Get.back();
        });
  }

  // logic SerchDelegate
  // GetxBuilder
  var SearchList = <ModelApi>[].obs;
  TextEditingController Controller = TextEditingController();
  void AddSeacrchList(String SearchName) {
    SearchName = SearchName.toLowerCase();

    SearchList.value = productList.where((search) {
      var TitleSearch = search.title.toLowerCase();
      var PriceSearch = search.price.toString().toLowerCase();
      return TitleSearch.contains(SearchName) ||
          PriceSearch.contains(SearchName);
    }).toList();

    update();
  }

  void SearchClear() {
    Controller.clear();
    AddSeacrchList("");
  }
}
