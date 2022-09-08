import 'package:fluent_books_author/controller/AuthCtrl.dart';
import 'package:fluent_books_author/src/register/CreateAccount.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

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

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({Key? key}) : super(key: key);
  static const String routeName = 'VerifyOTP';

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  final AuthCtrl authX = Get.put(AuthCtrl());
  final TextEditingController otpCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleMimosa,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody:false,
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
                          maxLength: 4,
                          inputType: TextInputType.number,
                          controller: otpCtrl,
                        ),

                        Row(
                          children: [
                            TextView(didntReceiveCode,style: txt_13_white,marginRight: s3,),
                            TextView(resendCode,style: txt_13_white_600_undr,)
                          ],
                        ),




                        GetBuilder<AuthCtrl>(
                          builder: (controller) {
                            return Button(
                              label: verify,
                              labelStyle: txt_16_white,
                              boxDeco: boxDecoration(color: blue, radius: s10, giveShadow: true),
                              marginVertical: s40,
                              isActive: authX.btnCtrl.otp,
                              ontap: (){
                                if(authX.btnCtrl.otp){
                                  authX.otpVerification((status,msg,error){
                                    if(status){
                                      Fluttertoast.showToast(msg: msg);
                                      Navigator.pushNamed(context, CreateAccount.routeName);
                                    }else{
                                      Fluttertoast.showToast(msg: error);
                                    }
                                  });
                                }
                              },
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                  const Expanded(child:  BottomBanner())]
              ),
            ),
          ],
        ),
      ),
    );
  }
  editTextDecoration(){
    return boxDecoration(color: white, radius: s10, giveShadow: true);
  }
}
