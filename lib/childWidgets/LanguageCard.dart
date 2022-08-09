import 'package:flutter/material.dart';

import '../CustomWidgets/ImageView.dart';
import '../CustomWidgets/TextView.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/fonts.dart';
import '../component/size.dart';

class LanguageCard extends StatelessWidget {
  const LanguageCard({Key? key, required this.color, required this.lang, required this.img, required this.status}) : super(key: key);
  final Color color;
  final String lang;
  final String img;
  final bool status;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: boxDecoration(color: color, radius: s10, giveShadow: true),
      padding: EdgeInsets.symmetric(horizontal: s10, vertical: s5),
      child: Row(
        children: [
          ImageView(img, size: s15 * 2, fit: BoxFit.contain,),
          Expanded(child: TextView(lang.toUpperCase(), style: txt_14_white_600,marginHorizontal: s15,)),
          Icon(status ? Icons.radio_button_checked_rounded : Icons.radio_button_off_outlined
            , color: grey100,)
        ],
      ),
    );
  }
}
