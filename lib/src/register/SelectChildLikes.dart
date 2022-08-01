import 'package:flutter/material.dart';

import '../../CustomWidgets/Button.dart';
import '../../CustomWidgets/ImageView.dart';
import '../../CustomWidgets/TextView.dart';
import '../../childWidgets/BottomBanner.dart';
import '../../component/appConstants.dart';
import '../../component/color.dart';
import '../../component/decoration.dart';
import '../../component/fonts.dart';
import '../../component/img.dart';
import '../../component/size.dart';
import 'SelectLanguages.dart';

class SelectChildLikes extends StatefulWidget {
  const SelectChildLikes({Key? key}) : super(key: key);
  static const String routeName = 'SelectChildLikes';

  @override
  State<SelectChildLikes> createState() => _SelectChildLikesState();
}

class _SelectChildLikesState extends State<SelectChildLikes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenishCyan,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(s15),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: ImageView(Img.logoImg,size: s15 * 10,)),

                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextView(yourChildLikes,style: txt_20_white_600_CM,marginTop: s40,)),



                  Button(
                    label: next,
                    labelStyle: txt_20_white,
                    boxDeco: boxDecoration(color: blue, radius: s10),
                    marginVertical: s40,
                    ontap: (){
                       Navigator.pushNamed(context, SelectLanguages.routeName);
                    },
                  ),
                ],
              ),
            ),
            const Spacer(),

            const BottomBanner(),
          ],
        ),
      ),
    );
  }
}
