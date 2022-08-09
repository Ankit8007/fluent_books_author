import 'package:flutter/material.dart';

import '../CustomWidgets/ImageView.dart';
import '../CustomWidgets/TextView.dart';
import '../component/fonts.dart';
import '../component/size.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({Key? key, required this.icon, required this.title, this.onTap, this.postChild}) : super(key: key);
  final String icon;
  final String title;
  final GestureTapCallback? onTap;
  final Widget? postChild;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: s20, vertical: s5),
        child: Row(
          children: [
            ImageView(
              icon,
              size: s15 * 2,
              fit: BoxFit.contain,
            ),
            TextView(
              title,
              style: txt_16_black,
              marginLeft: s15,
            ),
            Spacer(),

            SizedBox(
              child: postChild,
            )
          ],
        ),
      ),
    );
  }
}
