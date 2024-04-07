// ignore_for_file: unused_local_variable

import 'package:asrooshop/Logic/Controller/ControllerGetApi.dart';
import 'package:asrooshop/Model/Model.dart';
import 'package:asrooshop/Utils/Constant/ConstantColor.dart';
import 'package:asrooshop/View/Screen/DetailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardView extends StatelessWidget {
  CardView({super.key});
  final controller = Get.find<ApiController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.IsLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Expanded(
            child: controller.SearchList.isEmpty &&
                    controller.Controller.text.isNotEmpty
                ? Image.asset("images/search_empry_light.png",
                    width: 300, height: 300)
                : GridView.builder(
                    itemCount: controller.SearchList.isEmpty
                        ? controller.productList.length
                        : controller.SearchList.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 150,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0),
                    itemBuilder: (context, index) {
                      if (controller.SearchList.isEmpty) {
                        return BuildCardItem(
                            productId: controller.productList[index].id,
                            image: controller.productList[index].image,
                            modelapi: controller.productList[index],
                            price: controller.productList[index].price,
                            rate: controller.productList[index].rating.rate,
                            title: controller.productList[index].title);
                      } else {
                        return BuildCardItem(
                            productId: controller.SearchList[index].id,
                            image: controller.SearchList[index].image,
                            modelapi: controller.SearchList[index],
                            price: controller.SearchList[index].price,
                            rate: controller.SearchList[index].rating.rate,
                            title: controller.SearchList[index].title);
                      }
                    }));
      }
    });
  }
}

BuildCardItem({
  required String image,
  required String title,
  required double price,
  required double rate,
  required int productId,
  required ModelApi modelapi,
}) {
  final controller = Get.find<ApiController>();
  return Container(
    decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.grey[800] : Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 2)
        ]),
    child: Column(
      children: [
        Obx(() {
          return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      controller.MangeFavorite(productId);
                    },
                    icon: controller.AddFavorite(productId)
                        ? Icon(Icons.favorite, size: 16, color: Colors.red)
                        : Icon(Icons.favorite_outline,
                            size: 16, color: Colors.black)),
                Expanded(
                  child: Text("${title}",
                      style: TextStyle(
                          fontSize: 11, overflow: TextOverflow.ellipsis)),
                ),
                IconButton(
                    onPressed: () {
                      controller.AddProductFromCard(modelapi);
                    },
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 15.5,
                    )),
              ]);
        }),
        Container(
            padding: EdgeInsets.all(4),
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6)),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                  elevation: MaterialStateProperty.all(0)),
              onPressed: () {
                Get.to(() => Details(
                      modelapi: modelapi,
                    ));
              },
              child: Image.network(
                "${image}",
                fit: BoxFit.fitHeight,
              ),
            )),
        Container(
          padding: EdgeInsets.only(top: 4),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Text("\$${price}", style: TextStyle(fontSize: 9)),
            SizedBox(
              width: 5,
            ),
            Container(
                width: 42,
                decoration: BoxDecoration(
                    color: Get.isDarkMode ? pink : Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("${rate}", style: TextStyle(fontSize: 9)),
                    Icon(
                      Icons.star,
                      size: 12,
                    )
                  ],
                )),
          ]),
        )
      ],
    ),
  );
}
