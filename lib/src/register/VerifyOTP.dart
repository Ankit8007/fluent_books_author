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
import 'UnderReview.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({Key? key}) : super(key: key);
  static const String routeName = 'VerifyOTP';

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink_magentaRed,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(s15),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: ImageView(Img.logoImg,size: s15 * 8,)),

                          Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(otpVerification,style: txt_18_white_600_CM,marginTop: s40 * 2,),
                                  TextView(otpDesc,style: txt_14_white,marginTop: s20,),
                                  TextView('Kevin@email.com',style: txt_14_white,),
                                ],
                              )),


                          EditText(
                            label: enterOTPHere,
                            labelStyle: txt_13_white,
                            hint: otpHere,
                            boxDeco: editTextDecoration(),
                            marginVertical: s20,
                          ),

                          Row(
                            children: [
                              TextView(didntReceiveCode,style: txt_13_white,marginRight: s3,),
                              TextView(resendCode,style: txt_13_white_600_undr,)
                            ],
                          ),



                          Button(
                            label: verify,
                            labelStyle: txt_16_white,
                            boxDeco: boxDecoration(color: blue, radius: s10, giveShadow: true),
                            marginVertical: s40,
                            ontap: (){
                              Navigator.pushNamed(context, UnderReview.routeName);
                            },
                          ),
                        ],
                      ),
                    ),
                    //const Spacer(),



                  ],
                ),
              ),
            ),
            const BottomBanner()
          ],
        ),
      ),
    );
  }
  editTextDecoration(){
    return boxDecoration(color: white, radius: s10, giveShadow: true);
  }
}
