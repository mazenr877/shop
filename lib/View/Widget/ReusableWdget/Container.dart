import 'package:flutter/material.dart';

class Containe extends StatelessWidget {
  final String tex;
  final EdgeInsetsGeometry padding;
  final Color color;
  final FontWeight fontweight;
  final double fontsize;
  const Containe({
    super.key,
    required this.tex,
    required this.padding,
    required this.color,
    required this.fontsize,
    required this.fontweight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Text(
        "${tex}",
        style:
            TextStyle(color: color, fontSize: fontsize, fontWeight: fontweight),
      ),
    );
  }
}
