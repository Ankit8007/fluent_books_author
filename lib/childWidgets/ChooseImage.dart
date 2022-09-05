import 'package:fluent_books_author/CustomWidgets/ImageView.dart';
import 'package:fluent_books_author/CustomWidgets/TextView.dart';
import 'package:fluent_books_author/component/fonts.dart';
import 'package:flutter/material.dart';

import '../component/size.dart';

class ChooseImage extends StatelessWidget {
  const ChooseImage({Key? key, this.cameraTap, this.galleryTap}) : super(key: key);
  final GestureTapCallback? cameraTap;
  final GestureTapCallback? galleryTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: s20 * 6,
      padding: EdgeInsets.symmetric(horizontal: s20,vertical: s10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextView('Choose Photo',style: txt_14_blue_600,marginVertical: s15,),

          Row(
            children: [
              ImageView('',icon: Icons.camera_alt,type: iconType,size: s15 * 2,onTap: cameraTap,marginRight: s20,),
              ImageView('',icon: Icons.image,type: iconType,size: s15 * 2,onTap: galleryTap,),
            ],
          )
        ],
      ),
    );
  }
}
