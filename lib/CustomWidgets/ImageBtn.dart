import 'package:flutter/material.dart';

import '../component/size.dart';

class ImageBtn extends StatelessWidget {
  const ImageBtn(
      {Key? key,
      this.boxDeco,
      this.margin,
      this.marginVertical,
      this.marginHorizontal,
      this.marginLeft,
      this.marginRight,
      this.marginTop,
      this.marginBottom,
      this.padding,
      this.paddingVertical,
      this.paddingHorizontal,
      this.paddingLeft,
      this.paddingRight,
      this.paddingTop,
      this.paddingBottom,
      this.childImg, this.size, this.width, this.height, this.onTap})
      : super(key: key);
  final BoxDecoration? boxDeco;
  final double? margin;
  final double? marginVertical;
  final double? marginHorizontal;
  final double? marginLeft;
  final double? marginRight;
  final double? marginTop;
  final double? marginBottom;
  final double? padding;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingTop;
  final double? paddingBottom;
  final Widget? childImg;
  final double? size;
  final double? width;
  final double? height;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size ?? width,
       height: size ?? height,
        decoration: boxDeco,
        margin: EdgeInsets.only(
          top: margin ?? marginVertical ?? marginTop ?? 0,
          bottom: margin ?? marginVertical ?? marginBottom ?? 0,
          left: margin ?? marginHorizontal ?? marginLeft ?? 0,
          right: margin ?? marginHorizontal ?? marginRight ?? 0,
        ),
        padding: EdgeInsets.only(
          top: padding ?? paddingVertical ?? paddingTop ?? s10,
          bottom: padding ?? paddingVertical ?? paddingBottom ?? s10,
          left: padding ?? paddingHorizontal ?? paddingLeft ?? s10,
          right: padding ?? paddingHorizontal ?? paddingRight ?? s10,
        ),
        child: childImg,
      ),
    );
  }
}
