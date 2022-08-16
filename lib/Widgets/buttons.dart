import 'package:flutter/material.dart';

Widget buttons(height, width, radius, text, color, tcolor, tsizes, tweight) {
  return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Center(
        child: Text(text,
            style: TextStyle(
                color: tcolor, fontSize: tsizes, fontWeight: tweight)),
      ));
}
