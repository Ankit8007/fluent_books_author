import 'package:flutter/material.dart';

import '../component/size.dart';
import 'TextView.dart';

class DropDown extends StatelessWidget {
  const DropDown({Key? key, required this.hint, this.hintStyle, this.boxDeco, this.margin, this.marginVertical, this.marginHorizontal, this.marginLeft, this.marginRight, this.marginTop, this.marginBottom, this.padding, this.paddingVertical, this.paddingHorizontal, this.paddingLeft, this.paddingRight, this.paddingTop, this.paddingBottom}) : super(key: key);
  final String hint;
  final TextStyle? hintStyle;
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

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(hint,style: hintStyle,),
          Icon(Icons.arrow_drop_down, size: s15 * 2,),
        ],
      ),
    );
  }
}
