// ignore_for_file: must_be_immutable

import 'package:asrooshop/Logic/Controller/ControllerGetApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatelessWidget {
  final controller = Get.find<ApiController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(
      builder: (_) => TextField(
          onChanged: (SearchName) {
            controller.AddSeacrchList(SearchName);
          },
          controller: controller.Controller,
          keyboardType: TextInputType.text,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(0),
            fillColor: Colors.white,
            focusColor: Colors.red,
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            suffixIcon: controller.Controller.text.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      controller.SearchClear();
                    },
                    icon: Icon(Icons.close, color: Colors.grey))
                : null,
            filled: true,
            labelText: "Search With Title and Price",
            labelStyle:
                TextStyle(fontSize: 9, color: Colors.black.withOpacity(0.5)),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10)),
          )),
    );
  }
}
