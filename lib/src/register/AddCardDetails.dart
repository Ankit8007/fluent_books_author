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
import 'AddChild.dart';

class AddCardDetails extends StatefulWidget {
  const AddCardDetails({Key? key}) : super(key: key);
  static const String routeName = 'AddCardDetails';
  @override
  State<AddCardDetails> createState() => _AddCardDetailsState();
}

class _AddCardDetailsState extends State<AddCardDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellowLightGold,
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
                      child: TextView('$addCardDetails ($optional)',style: txt_20_white_600_CM,marginTop: s40,)),

                  EditText(
                    hint: nameOnCard,
                    boxDeco: editTextDecoration(),
                    marginVertical: s20,
                  ),

                  EditText(
                    hint: cardNo,
                    boxDeco: editTextDecoration() ,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: EditText(
                          hint: cardExpiry,
                          boxDeco: editTextDecoration() ,
                          marginVertical: s20,
                          marginRight: s10,
                        ),
                      ),

                      Expanded(
                        child: EditText(
                          hint: cvv,
                          boxDeco: editTextDecoration() ,
                          marginLeft: s10,
                        ),
                      ),
                    ],
                  ),


                  Button(
                    label: skip,
                    labelStyle: txt_20_white,
                    boxDeco: boxDecoration(color: blue, radius: s10),
                    marginVertical: s40,
                    ontap: (){
                      Navigator.pushNamed(context, AddChild.routeName);
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
