// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

const Color pink = Color(0xFFff4667);
const Color dark = Color(0xFF121212);
const Color color1 = Color(0xff685959);
const Color color2 = Color(0xffADA79B);
const Color color3 = Color(0xffA5947F);
const Color color4 = Color(0xff738B71);
const Color color5 = Color(0xff6D454D);
const Color green = Colors.green;
const url = "https://fakestoreapi.com";
String Engilsh = "English 🏳️‍🌈";
String France = "France 🏴‍☠️";
String Arabic = "Arabic 🎌";
String ene = "en";
String fre = "fr";
String are = "ar";

class theme {
  static final light = ThemeData(
      primaryColor: Colors.green,
      colorScheme: ColorScheme.light(),
      brightness: Brightness.light);
  static final dark = ThemeData(
      primaryColor: Colors.pink,
      colorScheme: ColorScheme.dark(),
      brightness: Brightness.dark);
}
