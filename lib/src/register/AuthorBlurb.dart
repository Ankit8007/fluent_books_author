import 'package:fluent_books_author/controller/AuthCtrl.dart';
import 'package:fluent_books_author/src/register/UploadIcon.dart';
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

class AuthorBlurb extends StatefulWidget {
  const AuthorBlurb({Key? key}) : super(key: key);
  static const String routeName = 'AuthorBlurb';

  @override
  State<AuthorBlurb> createState() => _AuthorBlurbState();
}

class _AuthorBlurbState extends State<AuthorBlurb> {
  final AuthCtrl authX = Get.put(AuthCtrl());
  final aboutCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellowishOrange,
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
                            child: TextView(authorBlurb,style: txt_18_white_600_CM,marginTop: s40,)),

                        EditText(
                          hint: writeAboutYou,
                          boxDeco: editTextDecoration(),
                          marginVertical: s20,
                          maxLines: 5,
                          minLines: 5,
                          inputType: TextInputType.multiline,
                          controller: aboutCtrl,
                          onChange: (String value) => authX.regData.about = value,

                        ),

                        GetBuilder<AuthCtrl>(
                          builder: (controller) {
                            return Button(
                              label: next,
                              labelStyle: txt_16_white,
                              boxDeco: boxDecoration(color: blue, radius: s10,giveShadow: true),
                              marginVertical: s40,
                              isActive: authX.btnCtrl.about,
                              ontap: (){
                                if(authX.btnCtrl.about){
                                  authX.updateAbout((status,msg,error){
                                    if(status){
                                      Fluttertoast.showToast(msg: msg);
                                      Navigator.pushNamed(context, UploadIcon.routeName);
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


