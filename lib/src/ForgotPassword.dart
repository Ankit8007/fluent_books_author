
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../CustomWidgets/Button.dart';
import '../CustomWidgets/EditText.dart';
import '../CustomWidgets/ImageView.dart';
import '../CustomWidgets/TextView.dart';
import '../childWidgets/BottomBanner.dart';
import '../component/appConstants.dart';
import '../component/color.dart';
import '../component/decoration.dart';
import '../component/fonts.dart';
import '../component/img.dart';
import '../component/size.dart';
import '../controller/AuthCtrl.dart';
import 'register/ContactDetails.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);
  static const String routeName = 'ForgotPassword';

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final AuthCtrl authX = Get.put(AuthCtrl());
  final TextEditingController ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleMimosa,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(s15),
                    child: Column(
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: ImageView(
                              Img.logoImg,
                              size: s15 * 8,
                            )),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: TextView(
                              forgotYourPassword_q,
                              style: txt_18_white_600_CM,
                              marginTop: s40 * 2,
                              marginBottom: s20,
                            )),
                        EditText(
                          hint: email,
                          boxDeco: editTextDecoration(),
                          marginVertical: s20,
                          controller: ctrl,
                        ),
                        Button(
                            label: submit,
                            labelStyle: txt_16_white,
                            boxDeco: boxDecoration(
                                color: blue, radius: s10, giveShadow: true),
                            ontap: () {
                              authX.forgotPassword(ctrl.text,(status,msg,error) {
                                if(status){
                                  Fluttertoast.showToast(msg: msg);
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => const Fragment(),
                                  //     ));
                                }else{
                                  Fluttertoast.showToast(msg: error);
                                }
                              });
                            }),
                      ],
                    ),
                  ),
                  const Spacer(),
                  const BottomBanner(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  editTextDecoration() {
    return boxDecoration(color: white, radius: s10, giveShadow: true);
  }
}