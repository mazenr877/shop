import 'package:asrooshop/View/Widget/CategoryItem.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 10, left: 4),
                alignment: Alignment.topLeft,
                child: Text("Category",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold))),
            SizedBox(height: 20),
            CategoryItem()
          ],
        ),
      )),
    );
  }
}
