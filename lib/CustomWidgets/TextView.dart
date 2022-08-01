import 'package:flutter/material.dart';

class TextView extends StatelessWidget {
  const TextView(this.text,
      {Key? key,
      this.style,
      this.margin,
      this.maxLines,
      this.textAlign,
      this.marginVertical,
      this.marginTop,
      this.marginHorizontal,
      this.marginLeft,
      this.marginBottom,
      this.marginRight, this.onTap})
      : super(key: key);
  final String text;
  final TextStyle? style;
  final double? margin;
  final double? marginVertical;
  final double? marginTop;
  final double? marginHorizontal;
  final double? marginLeft;
  final double? marginBottom;
  final double? marginRight;
  final int? maxLines;
  final TextAlign? textAlign;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          top: margin ?? marginVertical ?? marginTop ?? 0,
          bottom: margin ?? marginVertical ?? marginBottom ?? 0,
          left: margin ?? marginHorizontal ?? marginLeft ?? 0,
          right: margin ?? marginHorizontal ?? marginRight ?? 0,
        ),
        child: Text(
          text,
          style: style,
          maxLines: maxLines,
          textAlign: textAlign,
        ),
      ),
    );
  }
}
