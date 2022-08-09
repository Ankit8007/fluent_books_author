import 'package:flutter/material.dart';

import '../CustomWidgets/TextView.dart';
import '../component/appConstants.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/fonts.dart';
import '../component/size.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration(radius: s10, borderColor: grey),
      padding: EdgeInsets.symmetric(horizontal: s15, vertical: s8),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Dot(),
          SizedBox(width: s10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(setupIntervDesc, style: txt_10_black,marginBottom: s10,),
                TextView('09:49 AM', style: txt_10_black,)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({Key? key, this.size, this.color}) : super(key: key);
  final double? size;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? s10,
      height: size ?? s10,
      decoration: boxDecoration(color: color ?? blue, radius: size != null ? size! /2 : s10/2),
    );
  }
}

