import 'package:flutter/material.dart';

import '../CustomWidgets/TextView.dart';
import '../component/color.dart';
import '../component/fonts.dart';
import '../component/size.dart';

class TabButton extends StatelessWidget {
  const TabButton({Key? key, required this.label, required this.status, this.onTap}) : super(key: key);
  final String label;
  final bool status;
  final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            TextView(label.toUpperCase(), style: status ? txt_12_blue_600 : txt_12_black_600,
            margin: s8,),
            Divider(
              color: status ? blue : greyHint,
              thickness: s5 / 1.5,
            )
          ],
        ),
      ),
    );
  }
}
