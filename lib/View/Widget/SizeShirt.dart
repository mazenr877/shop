// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeShirt extends StatefulWidget {
  @override
  State<SizeShirt> createState() => _SizeShirtState();
}

class _SizeShirtState extends State<SizeShirt> {
  int count = 0;

  List<String> Size = [
    "S",
    "M",
    "L",
    "XL",
    "XLM",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            setState(() {
              count = index;
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: Get.isDarkMode
                    ? count == index
                        ? Colors.pink.withOpacity(0.4)
                        : Colors.black.withOpacity(0.8)
                    : count == index
                        ? Colors.green.withOpacity(0.4)
                        : Colors.black.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15)),
            child: Text("${Size[index]}"),
          ),
        ),
        itemCount: Size.length,
        separatorBuilder: (context, int index) {
          return SizedBox(
            width: 5,
          );
        },
      ),
    );
  }
}
