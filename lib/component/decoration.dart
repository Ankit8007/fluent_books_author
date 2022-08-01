import 'package:flutter/material.dart';

BoxDecoration boxDecoration({Color? color, Color? borderColor, double radius = 0,}) {
  return BoxDecoration(
    color: color,
    border: Border.all(width: 1, color: borderColor ?? Colors.transparent),
    borderRadius: BorderRadius.circular(radius),
    //boxShadow:,
    //gradient:,
    //shape:,
  );
}