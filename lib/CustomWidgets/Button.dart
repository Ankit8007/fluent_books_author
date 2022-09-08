import 'package:flutter/material.dart';
import '../component/size.dart';
import 'TextView.dart';

class Button extends StatelessWidget {
  const Button(
      {Key? key,
      this.ontap,
      required this.label,
      this.labelStyle,
      this.padding,
      this.margin,
      this.boxDeco,
      this.width,
      this.marginVertical,
      this.marginHorizontal,
      this.marginTop,
      this.marginLeft,
      this.marginRight,
        this.isActive = true,
      this.marginBottom, this.paddingVertical, this.paddingHorizontal, this.paddingTop, this.paddingLeft, this.paddingRight, this.paddingBottom})
      : super(key: key);
  final GestureTapCallback? ontap;
  final String label;
  final TextStyle? labelStyle;
  final double? margin;
  final double? marginVertical;
  final double? marginHorizontal;
  final double? marginTop;
  final double? marginLeft;
  final double? marginRight;
  final double? marginBottom;
  final double? padding;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final double? paddingTop;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingBottom;
  final BoxDecoration? boxDeco;
  final double? width;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
        child: Container(
          width: width ?? double.infinity,
          padding: EdgeInsets.only(
            top: padding ?? paddingVertical ?? paddingTop ?? s10,
            bottom: padding ?? paddingVertical ?? paddingBottom ?? s10,
            left: padding ?? paddingHorizontal ?? paddingLeft ?? s10,
            right: padding ?? paddingHorizontal ?? paddingRight ?? s10,
          ),
          margin: EdgeInsets.only(
            top: margin ?? marginVertical ?? marginTop ?? 0,
            bottom: margin ?? marginVertical ?? marginBottom ?? 0,
            left: margin ?? marginHorizontal ?? marginLeft ?? 0,
            right: margin ?? marginHorizontal ?? marginRight ?? 0,
          ),
          decoration: boxDeco,
          child: isActive ? TextView(
            label.toUpperCase(),
            style: labelStyle,
            maxLines: 1,
            textAlign: TextAlign.center,
          ) : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width : s15 * 2 , height: s15 * 2 ,child: const CircularProgressIndicator( color: Colors.white,strokeWidth: 1.5,)),
            ],
          ),
        ));
  }
}
