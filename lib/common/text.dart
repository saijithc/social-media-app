import 'package:flutter/material.dart';

Widget text(text, color, sizes, weight, maxlines) {
  return Text(
    text,
    style: TextStyle(
        color: color,
        fontSize: sizes,
        fontWeight: weight,
        overflow: TextOverflow.ellipsis),
    maxLines: maxlines,
  );
}

Widget text1(text,
    {Color? color,
    double? sizes,
    FontWeight? weight,
    int? maxlines,
    TextOverflow? overflow}) {
  return Text(
    text,
    overflow: overflow,
    style: TextStyle(
        color: color,
        fontSize: sizes,
        fontWeight: weight,
        overflow: TextOverflow.ellipsis),
    maxLines: maxlines,
  );
}
