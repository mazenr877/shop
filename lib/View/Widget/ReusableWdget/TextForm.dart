// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names, prefer_const_constructors
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType kybord;
  Function(String?)? validator;
  final Widget prefixIcon;
  final String hint;
  final Widget suffixIcon;
  TextForm({
    required this.controller,
    required this.obscureText,
    required this.kybord,
    required this.prefixIcon,
    required this.hint,
    required this.suffixIcon,
    required this.validator,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: kybord,
      validator: (value) => validator!(value),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: Colors.grey.shade300,
        labelText: hint,
        filled: true,
        labelStyle: TextStyle(fontSize: 9),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10)),
            
      ),
    );
  }
}
