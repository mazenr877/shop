// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:asrooshop/Logic/Controller/ControllerGetApi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteScreen extends StatelessWidget {
  final controller = Get.find<ApiController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Obx(() {
        if (controller.productFavorite.isEmpty) {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Container(
                child: Image.asset(
                  "images/heart.png",
                  fit: BoxFit.contain,
                  width: 230,
                ),
              ),
              SizedBox(height: 10),
              Text("please add your favorite products",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))
            ],
          ));
        } else {
          return Container(
            child: ListView.builder(
                itemCount: controller.productFavorite.length,
                itemBuilder: (context, index) => SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Card(
                            elevation: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 9,
                                      ),
                                      Image.network(
                                        "${controller.productFavorite[index].image}",
                                        width: 50,
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            "brand",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                              "\$ ${controller.productFavorite[index].price}",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {
                                      controller.MangeFavorite(
                                          controller.productFavorite[index].id);
                                    },
                                    icon: Icon(Icons.favorite,
                                        size: 16, color: Colors.red))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
          );
        }
      })),
    );
  }
}
