import 'package:flutter/material.dart';

import '../CustomWidgets/ImageView.dart';
import '../component/img.dart';
import '../component/size.dart';

class ToggleSwitch extends StatelessWidget {
  const ToggleSwitch({Key? key, required this.status, this.onTap}) : super(key: key);
  final bool status;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ImageView(status ? Img.toggleOn : Img.toggleOff, size: s15 * 2, onTap: onTap,);
  }
}
