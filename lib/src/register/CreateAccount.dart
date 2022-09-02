import 'package:fluent_books_author/controller/AuthCtrl.dart';
import 'package:fluent_books_author/src/register/CreatePassword.dart';
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
import 'ContactDetails.dart';
import 'UploadIcon.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);
  static const String routeName = 'CreateAccount';
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final AuthCtrl authX = Get.put(AuthCtrl());
  final firstCtrl = TextEditingController();
  final lastCtrl = TextEditingController();
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
                            child: ImageView(Img.logoImg,size: s15 * 10,)),

                        Align(
                            alignment: Alignment.centerLeft,
                            child: TextView(createYourAccount,style: txt_18_white_600_CM,marginTop: s40,)),

                        EditText(
                          hint: firstName,
                          boxDeco: editTextDecoration(),
                          marginVertical: s20,
                          controller: firstCtrl,
                          onChange: (String value) => authX.regData.firstName = value,
                        ),

                        EditText(
                          hint: lastName,
                          boxDeco: editTextDecoration() ,
                          controller: lastCtrl,
                          onChange: (String value) => authX.regData.lastName = value,
                        ),

                        Button(
                            label: next,
                            labelStyle: txt_16_white,
                            boxDeco: boxDecoration(color: blue, radius: s10,giveShadow: true),
                          marginVertical: s40,
                          ontap: (){
                              authX.updateName((status,msg,error){
                                if(status){
                                  Fluttertoast.showToast(msg: msg);
                                  Navigator.pushNamed(context, CreatePassword.routeName);
                                }else{
                                  Fluttertoast.showToast(msg: error);
                                }
                              });

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
          ],
        ),
      ),
    );
  }
  editTextDecoration(){
    return boxDecoration(color: white, radius: s10,giveShadow: true);
  }
}
