// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

ImagePicker({required Color color, required bool outerBorder}) {
  return Container(
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: outerBorder ? Border.all(color: color, width: 3) : null),
    child: Container(
      padding: EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    ),
  );
}
