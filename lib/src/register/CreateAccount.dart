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
import 'ContactDetails.dart';
import 'UploadIcon.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);
  static const String routeName = 'CreateAccount';
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleMimosa,
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
                      child: TextView(createYourAccount,style: txt_18_white_600_CM,marginTop: s40,)),

                  EditText(
                    hint: firstName,
                    boxDeco: editTextDecoration(),
                    marginVertical: s20,
                  ),

                  EditText(
                    hint: lastName,
                    boxDeco: editTextDecoration() ,
                  ),

                  Button(
                      label: next,
                      labelStyle: txt_16_white,
                      boxDeco: boxDecoration(color: blue, radius: s10,giveShadow: true),
                    marginVertical: s40,
                    ontap: (){
                        Navigator.pushNamed(context, UploadIcon.routeName);
                    },

                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.end,
                  //   children: [
                  //     TextView(dontHaveAnAccount_q,marginRight: s3, marginTop: s40,style: txt_13_white,),
                  //     TextView(sign_up,style: txt_13_blue_600_undr,)
                  //   ],
                  // )
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
    return boxDecoration(color: white, radius: s10,giveShadow: true);
  }
}
