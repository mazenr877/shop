// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages, unused_import, deprecated_member_use

import 'package:asrooshop/Logic/Controller/Controller.dart';
import 'package:asrooshop/Utils/Constant/ConstantColor.dart';
import 'package:asrooshop/View/Screen/Auth/ForgotScreen.dart';
import 'package:asrooshop/View/Screen/Auth/SignupScreen.dart';
import 'package:asrooshop/View/Widget/ReusableWdget/Container.dart';
import 'package:asrooshop/View/Widget/ReusableWdget/TextForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController Email = TextEditingController();
  final TextEditingController Password = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? dark : Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Form(
            key: formkey,
            child: Container(
              padding: EdgeInsets.only(top: 20, left: 25, right: 25),
              child: Column(
                children: [
                  Row(
                    children: [
                      Containe(
                        fontweight: FontWeight.bold,
                        tex: 'Log',
                        padding: EdgeInsets.zero,
                        color: Get.isDarkMode ? Colors.green : pink,
                        fontsize: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Containe(
                        fontweight: FontWeight.bold,
                        tex: "In",
                        padding: EdgeInsets.zero,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        fontsize: 16,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextForm(
                    validator: (value) {},
                    controller: Email,
                    hint: "Email",
                    obscureText: false,
                    prefixIcon: Image.asset(
                      color: Get.isDarkMode ? Colors.green : Colors.pink,
                      "images/email.png",
                      width: 10,
                    ),
                    kybord: TextInputType.name,
                    suffixIcon: Text(""),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextForm(
                    validator: (value) {
                      if (value.toString().length < 6) {
                        return "invalid Password";
                      } else
                        return null;
                    },
                    controller: Password,
                    hint: "Password",
                    obscureText: true,
                    prefixIcon: Image.asset(
                      color: Get.isDarkMode ? Colors.green : Colors.pink,
                      "images/lock.png",
                    ),
                    kybord: TextInputType.name,
                    suffixIcon: Text(""),
                  ),
                  Container(
                    height: 30,
                    alignment: Alignment.topRight,
                    child: TextButton(
                        onPressed: () {
                          Get.off(() => ForgotPassword());
                        },
                        child: Text("Forgot Password?",
                            style: TextStyle(
                                fontSize: 8,
                                color: Get.isDarkMode
                                    ? Colors.black.withOpacity(0.3)
                                    : Colors.pink))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  GetBuilder<HomePage>(
                    init: HomePage(),
                    builder: (controller) => Row(
                      children: [
                        InkWell(
                          onTap: () {
                            controller.ischeck();
                          },
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 4, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(5)),
                              child: controller.check
                                  ? Container(
                                      width: 22, height: 17, child: Text(""))
                                  : Image.asset(
                                      "images/check.png",
                                      color: Get.isDarkMode
                                          ? Colors.green
                                          : Colors.pink,
                                    )),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Remember me",
                          style: TextStyle(
                              fontSize: 9,
                              color:
                                  Get.isDarkMode ? Colors.white : Colors.pink),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GetBuilder<HomePage>(
                    init: HomePage(),
                    builder: (controller) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Get.isDarkMode ? Colors.green : Colors.pink,
                            padding: EdgeInsets.symmetric(horizontal: 103),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6))),
                        onPressed: () {
                          if (controller.check == true) {
                            Get.snackbar("click", "CheckBox");
                          } else if (formkey.currentState!.validate()) {
                            controller.LoginFromFirebase(
                                Email: Email.text, Password: Password.text);
                          }
                        },
                        child: Text(
                          "LOGIN IN",
                          style: TextStyle(fontSize: 11, color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Containe(
                    tex: 'OR',
                    color: Get.isDarkMode ? Colors.white : Colors.pink,
                    fontsize: 10,
                    fontweight: FontWeight.bold,
                    padding: EdgeInsets.zero,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        InkWell(
                            onTap: () {},
                            child: Image.asset("images/facebook.png")),
                        SizedBox(
                          width: 10,
                        ),
                        GetBuilder<HomePage>(
                          builder: (controller) => InkWell(
                              onTap: () {
                                controller.GoogleSignInFromFirebase();
                              },
                              child: Image.asset("images/google.png")),
                        ),
                      ]))
                ],
              ),
            ),
          ),
          SizedBox(height: 40),
          Column(
            children: [
              Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  decoration: BoxDecoration(
                      color: Get.isDarkMode ? Colors.green : Colors.pink,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an Accont?",
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.off(() => SignupScreen());
                          },
                          child: Text("Sign Up",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 11,
                                  color: Colors.white)))
                    ],
                  ))
            ],
          )
        ],
      )),
    ));
  }
}
