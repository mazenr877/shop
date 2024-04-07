// ignore_for_file: prefer_const_constructors, unused_import, depend_on_referenced_packages

import 'package:asrooshop/View/Screen/Auth/LoginScreen.dart';
import 'package:asrooshop/View/Screen/Auth/SignupScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                "images/ground.png",
                fit: BoxFit.cover,
              )),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 190,
                ),
                Container(
                  width: 140,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: 160,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Asroo",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.green,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Shop",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 180,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(horizontal: 27),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6))),
                    onPressed: () {
                      Get.off(() => LoginScreen());
                    },
                    child: Text(
                      "Get Start",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    )),
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(children: [
                        Text("Dont't have An Acount?",
                            style:
                                TextStyle(fontSize: 12, color: Colors.white)),
                        TextButton(
                            onPressed: () {
                              Get.off(() => SignupScreen());
                            },
                            child: Text("Sign Up",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 12,
                                    color: Colors.white)))
                      ]),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
