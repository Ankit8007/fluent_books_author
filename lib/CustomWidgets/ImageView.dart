import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const int svgImage = 4;
const int assetImage = 1;
const int networkImage = 2;
const int fileImage = 3;
const int iconType = 5;

class ImageView extends StatelessWidget {
  const ImageView(this.src,
      {Key? key,
        this.size,
        this.icon,
        this.width,
        this.height,
        this.fit,
        this.type,
        this.margin,
        this.marginVertical,
        this.marginHorizontal,
        this.marginTop,
        this.marginLeft,
        this.marginRight,
        this.marginBottom,
        this.boxDeco,
        this.radius, this.onTap})
      : super(key: key);
  final String src;
  final IconData? icon;
  final double? size;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final int? type;
  final double? margin;
  final double? marginVertical;
  final double? marginHorizontal;
  final double? marginTop;
  final double? marginLeft;
  final double? marginRight;
  final double? marginBottom;
  final BoxDecoration? boxDeco;
  final double? radius;
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
              left: margin ?? marginHorizontal ?? marginLeft ?? 0,
              right: margin ?? marginHorizontal ?? marginRight ?? 0,
              bottom: margin ?? marginVertical ?? marginBottom ?? 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(radius ?? 0),
            child: type == null || type == assetImage
                ? Image.asset(
              src,
              fit: fit,
            )
                : type == networkImage
                ? Image.asset(
              src,
              fit: fit,
            )
                : type == fileImage
                ? Image.file(
              File(src),
              fit: fit,
            )
                : type == svgImage
                ? SvgPicture.asset(src,
                //color: Colors.red,
                fit: fit ?? BoxFit.contain,
                semanticsLabel: 'A red up arrow')
                : type == iconType ?
                Icon(icon,size: size,): null,
          )),
    );
  }
}
