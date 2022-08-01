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

class SelectLanguages extends StatefulWidget {
  const SelectLanguages({Key? key}) : super(key: key);
  static const String routeName = 'SelectLanguages';

  @override
  State<SelectLanguages> createState() => _SelectLanguagesState();
}

class _SelectLanguagesState extends State<SelectLanguages> {
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


                  Row(
                    children: [
                      Expanded(child: TextView(selectLangDesc,style: txt_10_white,)),
                      Button(
                        label: details,
                        labelStyle: txt_10_white,
                        width: s15 * 5,
                        boxDeco: boxDecoration(color: blue, radius: s5),
                        padding: s5,
                      )
                    ],
                  ),

                  Button(
                    label: next,
                    labelStyle: txt_20_white,
                    boxDeco: boxDecoration(color: blue, radius: s10),
                    marginVertical: s40,
                    ontap: (){
                      // Navigator.pushNamed(context, AddChild.routeName);
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
