// ignore_for_file: prefer_const_constructors, unused_import, unused_local_variable, non_constant_identifier_names, deprecated_member_use

import 'package:asrooshop/Logic/Controller/Controller.dart';
import 'package:asrooshop/Utils/Constant/ConstantColor.dart';
import 'package:asrooshop/View/Screen/Auth/LoginScreen.dart';
import 'package:asrooshop/View/Screen/MainScreen.dart';
import 'package:asrooshop/View/Widget/ReusableWdget/Container.dart';
import 'package:asrooshop/View/Widget/ReusableWdget/TextForm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController UserName = TextEditingController();
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
          Container(
            padding: EdgeInsets.only(top: 20, left: 25, right: 25),
            child: Form(
              key: formkey,
              child: GetBuilder<HomePage>(
                init: HomePage(),
                builder: (controller) => Column(
                  children: [
                    Row(
                      children: [
                        Containe(
                          fontweight: FontWeight.bold,
                          tex: 'Sign',
                          padding: EdgeInsets.zero,
                          color: Get.isDarkMode ? Colors.green : pink,
                          fontsize: 16,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Containe(
                          fontweight: FontWeight.bold,
                          tex: "Up",
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
                      controller: UserName,
                      hint: "UserName",
                      obscureText: false,
                      prefixIcon: Image.asset(
                        "images/user.png",
                        color: Get.isDarkMode ? Colors.green : Colors.pink,
                      ),
                      kybord: TextInputType.name,
                      suffixIcon: Text(""),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextForm(
                      validator: (value) {},
                      controller: Email,
                      hint: "Email",
                      obscureText: false,
                      prefixIcon: Image.asset(
                        "images/email.png",
                        color: Get.isDarkMode ? Colors.green : Colors.pink,
                        width: 10,
                      ),
                      kybord: TextInputType.name,
                      suffixIcon: Text(""),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GetBuilder<HomePage>(
                      init: HomePage(),
                      builder: (controller) => TextForm(
                        validator: (value) {},
                        controller: Password,
                        hint: "Password",
                        obscureText: controller.visibility,
                        prefixIcon: Image.asset(
                          "images/lock.png",
                          color: Get.isDarkMode ? Colors.green : Colors.pink,
                        ),
                        kybord: TextInputType.name,
                        suffixIcon: IconButton(
                          color: Get.isDarkMode ? Colors.white : Colors.pink,
                          onPressed: () {
                            controller.visibilit();
                          },
                          icon: controller.visibility
                              ? Icon(Icons.visibility)
                              : Icon(Icons.visibility_off),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    GetBuilder<HomePage>(
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
                            width: 10,
                          ),
                          Text(
                            "I accept ",
                            style: TextStyle(
                                fontSize: 9,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.pink),
                          ),
                          Text(
                            "Terms & Conditions",
                            style: TextStyle(
                                fontSize: 9,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.pink),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45,
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
                              controller.SignUpFromFirebase(
                                  Email: Email.text.trim(),
                                  Password: Password.text,
                                  UserName: UserName.text.trim());
                            }
                          },
                          child: Text(
                            "SIGN UP",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 49),
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
                        'Already have an Account?',
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.off(() => LoginScreen());
                          },
                          child: Text("Logn In",
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
