// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors, must_be_immutable, invalid_use_of_protected_member, prefer_const_constructors
import 'package:asrooshop/View/Widget/GridView.dart';
import 'package:asrooshop/View/Widget/Search_Field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageScreen extends StatelessWidget {
  TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: context.theme.colorScheme.background,
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 160,
                  decoration: BoxDecoration(
                      color: Get.isDarkMode ? Colors.black : Colors.green,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))),
                  child: Padding(
                    padding: EdgeInsets.only(top: 18, left: 18, right: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Find Your",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "INSPIRATION",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Search()
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(18),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Category",
                    style: TextStyle(fontSize: 13),
                  ),
                ),
                CardView()
              ],
            )));
  }
}
