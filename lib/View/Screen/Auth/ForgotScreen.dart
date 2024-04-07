// ignore_for_file: unused_import, deprecated_member_use

import 'package:asrooshop/Logic/Controller/Controller.dart';
import 'package:asrooshop/Utils/Constant/ConstantColor.dart';
import 'package:asrooshop/View/Screen/Auth/LoginScreen.dart';
import 'package:asrooshop/View/Widget/ReusableWdget/TextForm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatelessWidget {
  final TextEditingController Email = TextEditingController();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.colorScheme.background,
        appBar: AppBar(
          title: Text(
            "Forgot Password",
            style: TextStyle(
              fontSize: 13,
              color: Get.isDarkMode ? Colors.black : Colors.pink,
            ),
          ),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? Colors.white : dark,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Get.off(() => LoginScreen());
              },
              icon: Icon(
                Icons.arrow_back,
                color: Get.isDarkMode ? Colors.black : Colors.white,
              )),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.all(25),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                          "if you forgot your account please provide your email ID",
                          style: TextStyle(
                            fontSize: 10,
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "images/forgetpass.png",
                      width: 230,
                      height: 230,
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
                        color: Get.isDarkMode ? Colors.green : Colors.pink,
                        "images/email.png",
                        width: 10,
                      ),
                      kybord: TextInputType.name,
                      suffixIcon: Text(""),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GetBuilder<HomePage>(
                      init: HomePage(),
                      builder: (controller) => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Get.isDarkMode
                                  ? Color.fromARGB(255, 108, 138, 109)
                                  : Colors.pink,
                              padding: EdgeInsets.symmetric(horizontal: 115.5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6))),
                          onPressed: () {
                            if (formkey.currentState!.validate()) {
                              controller.ForgotPasswordFromFirebase(
                                  Email: Email.text);
                            }
                          },
                          child: Text(
                            "SEND",
                            style: TextStyle(fontSize: 11, color: Colors.white),
                          )),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
