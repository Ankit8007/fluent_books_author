import 'package:fluent_books_author/controller/AuthCtrl.dart';
import 'package:fluent_books_author/src/register/AuthorBlurb.dart';
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
import 'AddAddress.dart';

//step":4
class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);
  static const String routeName = 'CreatePassword';
  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final AuthCtrl authX = Get.put(AuthCtrl());
  final passCtrl = TextEditingController();
  final confirmCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: peach,
      body: SafeArea(
        child: CustomScrollView(slivers: [
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
                            child: TextView(addPassword,style: txt_18_white_600_CM,marginTop: s40,)),

                        EditText(
                          hint: password,
                          boxDeco: editTextDecoration(),
                          marginVertical: s20,
                          controller: passCtrl,
                          inputType: TextInputType.visiblePassword,
                          secureText: true,
                          maxLength: 25,
                          onChange: (String value) => authX.regData.password = value,
                        ),

                        EditText(
                          hint: confirmPassword,
                          boxDeco: editTextDecoration() ,
                          controller: confirmCtrl,
                          inputType: TextInputType.visiblePassword,
                          secureText: true,
                          maxLength: 25,
                          onChange: (String value) => authX.regData.rePassword = value,
                        ),

                        GetBuilder<AuthCtrl>(
                          builder: (controller) {
                            return Button(
                              label: next,
                              labelStyle: txt_16_white,
                              boxDeco: boxDecoration(color: blue, radius: s10,giveShadow: true),
                              marginVertical: s40,
                              isActive: authX.btnCtrl.password,
                              ontap: (){
                                if(authX.btnCtrl.password){
                                  authX.updatePassword((status,msg,error){
                                    if(status){
                                      Fluttertoast.showToast(msg: msg);
                                      Navigator.pushNamed(context, AuthorBlurb.routeName);
                                    }else{
                                      Fluttertoast.showToast(msg: error);
                                    }
                                  });
                                }
                              },
                            );
                          }
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   crossAxisAlignment: CrossAxisAlignment.end,
                        //   children: [
                        //     TextView(dontHaveAnAccount_q,marginRight: s3, marginTop: s40,style: txt_15_white,),
                        //     TextView(sign_up,style: txt_15_blue_600_undr,)
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
