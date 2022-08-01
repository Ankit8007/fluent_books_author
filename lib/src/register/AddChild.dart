import 'package:flutter/material.dart';

import '../../CustomWidgets/Button.dart';
import '../../CustomWidgets/EditText.dart';
import '../../CustomWidgets/ImageView.dart';
import '../../CustomWidgets/TextView.dart';
import '../../childWidgets/BottomBanner.dart';
import '../../component/appConstants.dart';
import '../../component/color.dart';
import '../../component/decoration.dart';
import '../../component/fonts.dart';
import '../../component/img.dart';
import '../../component/size.dart';
import 'SelectChildLikes.dart';

class AddChild extends StatefulWidget {
  const AddChild({Key? key}) : super(key: key);
  static const String routeName = 'AddChild';

  @override
  State<AddChild> createState() => _AddChildState();
}

class _AddChildState extends State<AddChild> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greenPaleOlive_light,
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
                      child: TextView(yourChildName,style: txt_20_white_600_CM,marginTop: s40,)),

                  EditText(
                    hint: yourChildName,
                    boxDeco: editTextDecoration(),
                    marginVertical: s20,
                  ),

                  EditText(
                    hint: yourChildAge,
                    boxDeco: editTextDecoration() ,
                  ),


                  Button(
                    label: next,
                    labelStyle: txt_20_white,
                    boxDeco: boxDecoration(color: blue, radius: s10),
                    marginVertical: s40,
                    ontap: (){
                      Navigator.pushNamed(context, SelectChildLikes.routeName);
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
  editTextDecoration(){
    return boxDecoration(color: white, radius: s10);
  }
}
