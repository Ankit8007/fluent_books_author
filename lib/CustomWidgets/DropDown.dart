import 'package:flutter/material.dart';

import '../component/size.dart';
import 'TextView.dart';

class DropDown extends StatelessWidget {
  const DropDown({Key? key, required this.hint, this.hintStyle}) : super(key: key);
  final String hint;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(hint,style: hintStyle,),
          Icon(Icons.arrow_drop_down, size: s20,),
        ],
      ),
    );
  }
}
