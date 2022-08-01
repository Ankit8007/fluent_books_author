import 'package:flutter/material.dart';

import '../CustomWidgets/ImageView.dart';
import '../component/img.dart';
import '../component/size.dart';

class BottomBanner extends StatelessWidget {
  const BottomBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageView(
      Img.bottomBanner,
      height: s20 * 5,
      width: double.infinity,
      fit: BoxFit.fill,
      type: svgImage,
    );
  }
}
