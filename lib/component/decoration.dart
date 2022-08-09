import 'package:flutter/material.dart';

BoxDecoration boxDecoration({
  Color? color,
  Color? borderColor,
  double radius = 0,
  double? radiusTop,
  bool dottedBorder = false,
  bool giveShadow = false,
}) {
  return BoxDecoration(
    color: color,
    border: Border.all(width: 1, color: borderColor ?? Colors.transparent),
      borderRadius: radiusTop != null ? BorderRadius.only(
          topRight: Radius.circular(radiusTop),
          topLeft: Radius.circular(radiusTop)
      ) :
      BorderRadius.circular(radius),
      boxShadow: giveShadow ? shadow : []
    //gradient:,
    //shape:,
  );
}

final shadow = [BoxShadow(
  color: Colors.black.withOpacity(0.2),
  spreadRadius: 3,
  blurRadius: 7,
  offset: Offset(0, 8), // changes position of shadow
)] ;
