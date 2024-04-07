// ignore_for_file: must_be_immutable

import 'package:asrooshop/Logic/Controller/ControllerGetApi.dart';
import 'package:asrooshop/Model/Model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCart extends StatelessWidget {
  final ModelApi modelapi;
  AddCart({super.key, required this.modelapi});

  final controller = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Column(
            children: [
              Text("Total",
                  style: TextStyle(color: Colors.grey.withOpacity(0.8))),
              SizedBox(height: 5),
              Text("\$ ${modelapi.price}", style: TextStyle()),
            ],
          ),
          SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.green)),
                onPressed: () {
                  controller.AddProductFromCard(modelapi);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add Cart",
                        style: TextStyle(fontSize: 13, color: Colors.white)),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ))
                  ],
                )),
          )
        ],
      ),
    );
  }
}
