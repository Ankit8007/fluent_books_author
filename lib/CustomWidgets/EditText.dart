import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../component/fonts.dart';
import '../component/size.dart';
import 'TextView.dart';

class EditText extends StatelessWidget {
  const EditText(
      {Key? key,
      this.maxLines,
      this.style,
      this.onTap,
      this.readOnly,
      this.textAlign,
      this.minLines,
      this.maxLength,
      this.keyboardType,
      this.enabled,
      this.controller,
      this.secureText,
      this.hint,
      this.boxDeco,
      this.label,
      this.labelStyle,
      this.margin,
      this.marginVertical,
      this.marginHorizontal,
      this.marginTop,
      this.marginLeft,
      this.marginRight,
      this.marginBottom, this.hintStyle, this.inputType, this.padding, this.paddingVertical, this.paddingHorizontal, this.paddingTop, this.paddingLeft, this.paddingRight, this.paddingBottom, this.preChild, this.postChild, this.fixedLines})
      : super(key: key);
  final int? maxLines;
  final TextStyle? style;
  final onTap;
  final bool? readOnly;
  final TextAlign? textAlign;
  final int? minLines;
  final int? fixedLines;
  final int? maxLength;
  final TextInput? keyboardType;

  //onChanged: ,
  final bool? enabled;
  final TextEditingController? controller;
  final bool? secureText;
  final String? hint;
  final TextStyle? hintStyle;
  final BoxDecoration? boxDeco;
  final String? label;
  final TextStyle? labelStyle;
  final double? margin;
  final double? marginVertical;
  final double? marginHorizontal;
  final double? marginTop;
  final double? marginLeft;
  final double? marginRight;
  final double? marginBottom;
  final TextInputType? inputType;
  final double? padding;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final double? paddingTop;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingBottom;
  final Widget? preChild;
  final Widget? postChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: margin ?? marginVertical ?? marginTop ?? 0,
        bottom: margin ?? marginVertical ?? marginBottom ?? 0,
        left: margin ?? marginHorizontal ?? marginLeft ?? 0,
        right: margin ?? marginHorizontal ?? marginRight ?? 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: label != null
                ? TextView(
                    label ?? '',
                    style: labelStyle,
                    marginBottom: s5,
                  )
                : null,
          ),
          Container(
            decoration: boxDeco,
            padding: EdgeInsets.only(
              top: padding ?? paddingVertical ?? paddingTop ?? 0,
              bottom: padding ?? paddingVertical ?? paddingBottom ?? 0,
              left: padding ?? paddingHorizontal ?? paddingLeft ?? s20,
              right: padding ?? paddingHorizontal ?? paddingRight ?? s20,
            ),
            child: Row(
              children: [
                SizedBox(
                  child: preChild,
                ),
                Expanded(
                  child: TextField(
                    style: txt_14_black,
                    // onTap: ,
                    // maxLines: ,
                    readOnly: readOnly ?? false,
                    // textAlign: ,
                     minLines: fixedLines ?? minLines,
                     maxLines: minLines ?? maxLines,
                     //maxLength: ,
                    // keyboardType: ,
                    // onChanged: ,
                    // enabled: ,
                    decoration: InputDecoration(
                      isDense: true,
                      hintText: hint ?? '',
                      hintStyle: hintStyle ?? txt_14_hint,
                      border: InputBorder.none,
                    ),
                    keyboardType: inputType,
                    obscureText: secureText ?? false,
                    controller: controller,
                  ),
                ),
                SizedBox(
                  child: postChild,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
