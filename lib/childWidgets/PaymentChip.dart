import 'package:flutter/material.dart';

import '../CustomWidgets/TextView.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/fonts.dart';
import '../component/size.dart';

class PaymentChip extends StatelessWidget {
  const PaymentChip({Key? key, required this.label, this.marginRight}) : super(key: key);
  final String label;
  final double? marginRight;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration(borderColor: grey100, radius: s8),
      padding: EdgeInsets.all(s5),
      margin: EdgeInsets.only(
        right: marginRight ?? 0
      ),
      child: Row(
        children: [
          TextView(label, style: txt_10_black,marginRight: s10,),
          Icon(Icons.keyboard_arrow_down_rounded, color: black, size: s20,)
        ],
      ),
    );
  }
}

