import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      this.marginBottom, this.hintStyle, this.inputType})
      : super(key: key);
  final int? maxLines;
  final TextStyle? style;
  final onTap;
  final bool? readOnly;
  final TextAlign? textAlign;
  final int? minLines;
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
        children: [
          SizedBox(
            child: label != null
                ? TextView(
                    label ?? '',
                    style: labelStyle,
                    marginBottom: s10,
                  )
                : null,
          ),
          Container(
            decoration: boxDeco,
            child: TextField(
              // style: ,
              // onTap: ,
              // maxLines: ,
              // readOnly: ,
              // textAlign: ,
              // minLines: ,
              // maxLength: ,
              // keyboardType: ,
              // onChanged: ,
              // enabled: ,
              decoration: InputDecoration(
                  hintText: hint ?? '',
                hintStyle: hintStyle,
                border: InputBorder.none,
              ),
              keyboardType: inputType,
              obscureText: secureText ?? false,
              controller: controller,
            ),
          ),
        ],
      ),
    );
  }
}
