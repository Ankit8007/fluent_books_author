import 'package:fluent_books_author/component/color.dart';
import 'package:fluent_books_author/component/decoration.dart';
import 'package:fluent_books_author/component/size.dart';
import 'package:flutter/material.dart';

class ChipCard extends StatelessWidget {
  const ChipCard(
      {Key? key,
      this.child,
      this.bgColor,
      this.radius,
      this.borderColor,
      this.paddingHorizontal,
      this.paddingVertical,
      this.padding,
      this.onTap})
      : super(key: key);
  final child;
  final Color? bgColor;
  final double? radius;
  final Color? borderColor;
  final double? paddingHorizontal;
  final double? paddingVertical;
  final double? padding;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          decoration: boxDecoration(
            color: bgColor,
            radius: radius ?? s10,
            borderColor: borderColor ?? black,
          ),
          padding: EdgeInsets.symmetric(
              vertical: padding ?? paddingVertical ?? 0,
              horizontal: padding ?? paddingHorizontal ?? 0),
          child: child),
    );
  }
}
