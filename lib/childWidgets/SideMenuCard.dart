import 'package:flutter/material.dart';

import '../CustomWidgets/ImageView.dart';
import '../CustomWidgets/TextView.dart';
import '../component/fonts.dart';
import '../component/size.dart';

class SideMenuCard extends StatelessWidget {
  const SideMenuCard(
      {Key? key, required this.icon, required this.title, this.onTap})
      : super(key: key);
  final String icon;
  final String title;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: s20),
        child: Row(
          children: [
            ImageView(
              icon,
              size: s20,
              fit: BoxFit.contain,
            ),
            TextView(
              title,
              style: txt_14_white,
              marginLeft: s15,
            )
          ],
        ),
      ),
    );
  }
}
