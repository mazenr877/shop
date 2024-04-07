// ignore_for_file: deprecated_member_use, must_be_immutable

import 'package:asrooshop/Logic/Controller/ControllerGetApi.dart';
import 'package:asrooshop/Model/Model.dart';
import 'package:asrooshop/View/Widget/AddCart.dart';
import 'package:asrooshop/View/Widget/SizeShirt.dart';
import 'package:badges/badges.dart' as badges;
import 'package:asrooshop/Utils/Constant/ConstantColor.dart';
import 'package:asrooshop/View/Screen/CardItem.dart';
import 'package:asrooshop/View/Widget/ImagePicker.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Details extends StatefulWidget {
  ModelApi modelapi;

  Details({super.key, required this.modelapi});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final controller = Get.find<ApiController>();
  List<Color> ListColor = [
    color1,
    color2,
    color3,
    color4,
    color5,
  ];
  int inde = 0;
  int page = 0;
  CarouselController crouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
            backgroundColor: context.theme.colorScheme.background,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Get.isDarkMode ? Colors.black : Colors.green,
              title: Text(
                "Detaills Screen",
                style: TextStyle(
                  fontSize: 12,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Stack(children: [
                      CarouselSlider.builder(
                          options: CarouselOptions(
                              aspectRatio: 2.0,
                              enlargeCenterPage: true,
                              viewportFraction: 1,
                              autoPlay: true,
                              height: 350,
                              onPageChanged: (index, reson) {
                                setState(() {
                                  inde = index;
                                });
                              },
                              autoPlayAnimationDuration: Duration(seconds: 2),
                              enableInfiniteScroll: false),
                          carouselController: crouselController,
                          itemCount: 3,
                          itemBuilder: (context, index, realIdx) {
                            return Container(
                                child: Image.network("${widget.modelapi.image}",
                                    width: 350, height: 350, fit: BoxFit.fill));
                          }),
                      Positioned(
                          bottom: 4,
                          right: 136,
                          child: AnimatedSmoothIndicator(
                            activeIndex: inde,
                            count: 3,
                            effect: ExpandingDotsEffect(
                                activeDotColor:
                                    Get.isDarkMode ? Colors.pink : Colors.green,
                                dotColor: Colors.black,
                                radius: 5,
                                dotHeight: 10,
                                dotWidth: 10),
                          )),
                      Positioned(
                          bottom: 10,
                          right: 5,
                          child: Container(
                            height: 200,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10)),
                            child: ListView.separated(
                                itemBuilder: ((context, index) =>
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            page = index;
                                          });
                                        },
                                        child: ImagePicker(
                                            color: ListColor[index],
                                            outerBorder: page == index))),
                                separatorBuilder: (context, index) =>
                                    SizedBox(height: 3),
                                itemCount: ListColor.length),
                          )),
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MaterialButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 9, right: 1, top: 5, bottom: 5),
                                decoration: BoxDecoration(
                                    color: Get.isDarkMode
                                        ? Colors.pink
                                        : Colors.green,
                                    borderRadius: BorderRadius.circular(18)),
                                child: Icon(Icons.arrow_back_ios,
                                    color: Colors.white),
                              ),
                            ),
                            badges.Badge(
                                badgeStyle: badges.BadgeStyle(),
                                position: badges.BadgePosition.topEnd(
                                    top: -8, end: 20),
                                badgeAnimation: badges.BadgeAnimation.slide(),
                                badgeContent: Text(
                                  "${controller.ProductMap.length}",
                                  style: TextStyle(color: Colors.white),
                                ),
                                child: MaterialButton(
                                  onPressed: () {
                                    Get.off(() => CardItem());
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: Get.isDarkMode
                                            ? Colors.pink
                                            : Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(18)),
                                    child: Icon(Icons.shopping_cart),
                                  ),
                                )),
                          ],
                        ),
                      )
                    ]),
                    SingleChildScrollView(
                      child: Container(
                        padding: EdgeInsets.only(left: 25, top: 20, right: 25),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text("${widget.modelapi.title}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 9)),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    controller.MangeFavorite(
                                        widget.modelapi.id);
                                  },
                                  child: CircleAvatar(
                                      backgroundColor:
                                          Colors.black.withOpacity(0.1),
                                      radius: 14,
                                      child: controller.AddFavorite(
                                              widget.modelapi.id)
                                          ? Icon(Icons.favorite,
                                              size: 17, color: Colors.red)
                                          : Icon(Icons.favorite_outline,
                                              size: 16, color: Colors.black)),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text("${widget.modelapi.rating.rate}",
                                    style: TextStyle(fontSize: 10)),
                                SizedBox(width: 10),
                                RatingBar.builder(
                                  initialRating: widget.modelapi.rating.rate,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemPadding:
                                      EdgeInsets.symmetric(horizontal: 2),
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {},
                                )
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ReadMoreText(
                              "the color could be sightly different between on the screen and in practice please not that body builds very by person mazen mohamed reda aml ibrahim bondok mahmoud wael amr amir fatma ",
                              trimLines: 3,
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black),
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'Show less',
                              moreStyle: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Get.isDarkMode
                                      ? Colors.pink
                                      : Colors.green),
                              lessStyle: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Get.isDarkMode
                                      ? Colors.pink
                                      : Colors.green),
                            ),
                            SizedBox(height: 2),
                            SizeShirt(),
                            AddCart(
                              modelapi: widget.modelapi,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
